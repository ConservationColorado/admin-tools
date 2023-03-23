/**
 * TODO
 *  --
 * Functions such as SpreadsheetApp#getUi will cause permission errors when called in
 * global variable declaration. This typically causes the custom menu items to not
 * appear properly. Declaring as a function may solve this problem with permissions 
 * while also having the desired global variable visibility. 
 * 
 */

const timeZone = SpreadsheetApp.getActive().getSpreadsheetTimeZone();

/**
 * Main function  of this script.
 * 
 * Runs through the current active spreadsheet and adds each meeting, if appropriate,
 * to the specified calendar. 
 */
function scheduleMeetings() {
  const spreadsheet = SpreadsheetApp.getActiveSheet();
  const calendarId = spreadsheet.getRange("'New Hire Info'!$B3").getValue();
  // allMeetings is always an n x 7 matrix of all event rows
  const allMeetings = spreadsheet.getRange("Builder!A2:G34").getValues(); 
  
  for (i = 0; i < allMeetings.length; i++) {
    // meeting is always a 1 x 7 array of this current row
    var meeting = allMeetings[i];
    
    var shouldInclude = meeting[0];
    if (shouldInclude) {
      createEvent(meeting, calendarId);
    }
  }
}

/**
 * Creates an event on the given calendar using the data contained within the given
 * array of cells.
 * 
 * @param {Array} meeting An array of Strings containing data for the meeting to create.
 * @param {String} calendarId The ID of the calendar to use.
 * @return The event that was created.
 */
function createEvent(meeting, calendarId) {
  var startTime = new Date(meeting[1]);
  var endTime = minutesAfter(startTime, meeting[2]);

  var summary = meeting[5];
  var description = meeting[6];
  var meetingId = generateId();

  var attendees = generateAttendees(meeting[3] + ", " + calendarId);
  var shouldSendInvites = meeting[4];

  var eventData = {
    "summary": summary,
    "location": "Virtual",
    "description": description,
    "start": {
      "dateTime": startTime.toISOString(),
      "timeZone": this.timeZone
    },
    "end": {
      "dateTime": endTime.toISOString(),
      "timeZone": this.timeZone
    },
    "attendees": attendees,
    "guestsCanInviteOthers": true,
    "guestsCanModify": true,
    "conferenceData": {
      "createRequest": {
        "conferenceSolutionKey": {
          "type": "hangoutsMeet"
        },
        "requestId": meetingId
      },
    },
  };
  
  var eventArgs = {
    "conferenceDataVersion": 1, // allow editable Google Meet conferences
    "sendUpdates": (shouldSendInvites)? "all" : "none"
  };

  return Calendar.Events.insert(eventData, calendarId, eventArgs);
}

/**
 * Generates an array of attendee objects using the given String of attendee emails.
 * 
 * @param {String} attendes A comma-separated String list of attendees.
 * @return An array of objects with one field: `email` of type String matched with
 *         each given email.
 */
function generateAttendees(attendees) {
  // Strip spaces & split to get an array of each email
  var emails = attendees.split(" ").join("").split(",");
  var attendeeList = [];
  emails.forEach(email => attendeeList.push({"email": email}));
  return attendeeList;
}

/**
 * Returns a new Date that is the given amount of minutes past the given one.
 * 
 * @param {Date} date The date the returned one will be time-shifted based upon.
 * @param {Number} minutes The amount of time to shift the given date
 * @return A new Date that is shifted in time based upon the given parameters.
 */
function minutesAfter(date, minutes) {
  return new Date(date.getTime() + minutes * 60000);
}

/**
 * Generates a random Google Meets request ID.
 * 
 * @return A random ID for a Google Meets room.
 */
function generateId() {
  return (Math.random() + 1).toString(36).substring(7)
}

/**
 * Adds this script to a new menu in the active spreadsheet.
 */
function onOpen(e) {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu("Add to...")
    .addItem("Calendar", "scheduleMeetings")
    .addToUi();
}
