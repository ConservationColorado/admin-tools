@echo Off

MKDIR C:\ODT

:CREATE_NEW
set file=c:\odt\test.txt
set source=c:\odt\test.txt
set target=c:\odt\test1.txt
set dest=c:\odt\configuration.xml
set PRD1_EDTN=0
set PRD2_EDTN=0
set PRD3_EDTN=0
set PRD4_EDTN=0
set /a PRD_1=0
set /a PRD_2=0
set /a PRD_3=0
set /a PRD_4=0
set /a PRD_5=0
set PRVS_INST=0


:PFORM
echo ************************************************
echo PLEASE CHOOSE PLATFORM (RECOMMENDED IS 32BIT)
echo (1) 64bit
echo (2) 32bit
choice /c 12
echo ************************************************
	:PFORM_CHC1
		if %errorlevel%==1 (set PFORM=64
		GOTO :LCNS_TYPE) else (GOTO :PFORM_CHC2)
	:PFORM_CHC2
		if %errorlevel%==2 (set PFORM=32
		GOTO :LCNS_TYPE) else (GOTO :PFORM_CHC1)
		
:LCNS_TYPE
echo ************************************************
echo PLEASE CHOOSE LICENSE TYPE
echo (1) VOLUME LICENSE
echo (2) RETAIL / SINGLE LICENSE
choice /c 12
echo ************************************************
	:LCNS_TYPE1
		if %errorlevel%==1 (set LCNS_TYPE=Volume
		set CHNL=PerpetualVL2019
		GOTO :PRD_SEL) else (GOTO :LCNS_TYPE2)
	:LCNS_TYPE2
		if %errorlevel%==2 (set LCNS_TYPE=Retail
		set CHNL=BROAD
		GOTO :PRD_SEL) else (GOTO :LCNS_TYPE1)

:PRD_SEL
echo ************************************************
echo PLEASE CHOOCE A THE PRODUCT
echo (1) OFFICE 2019 SUITE
echo (2) VISIO 2019
echo (3) PROJECT 2019
echo (4) SINGLE STANDALONE APP 2019 (EXCELL OR ACCESS OR ANY OFFICE APP)
echo (5) OFFICE 365
choice /c 12345
echo ************************************************
	:CHC1_1
		if %errorlevel%==1 (set PRD_1=1
			GOTO :PRD1_EDTN) else (GOTO :CHC1_2)
	:CHC1_2
		if %errorlevel%==2 (set PRD_2=1
			GOTO PRD2_EDTN) else (GOTO :CHC1_3)
	:CHC1_3
		if %errorlevel%==3 (set PRD_3=1
			GOTO PRD3_EDTN) else (GOTO :CHC1_4)
	:CHC1_4
		if %errorlevel%==4 (set PRD_4=1
			GOTO :PRD4_EDTN) else (GOTO :CHC1_5)
	:CHC1_5
		if %errorlevel%==5 (set PRD_5=1
			GOTO :PRD5_EDTN) else (GOTO :CHC1_1)
			
:PRD1_EDTN
	echo ************************************************
	echo PLEASE CHOOSE YOUR OFFICE 2019  EDITION
	echo (1) OFFICE STANDARD
	echo (2) OFFICE PROFESSIONAL
	echo (3) OFFICE PROFESSIONAL PLUS
	choice /c 1235
	echo ************************************************
	
	:EDTN1_CHC1
		if %errorlevel%==1 (set PRD1_EDTN=Standard2019
		GOTO :PK1) else (GOTO :EDTN1_CHC2)
	:EDTN1_CHC2
		if %errorlevel%==2 (set PRD1_EDTN=Professional2019
		GOTO :PK1) else (GOTO :EDTN1_CHC3)
	:EDTN1_CHC3
		if %errorlevel%==3 (set PRD1_EDTN=ProPlus2019
		GOTO :PK1) else (GOTO :EDTN1_CHC1)
:PK1
	echo ************************************************
	echo PLEASE KEY IN YOUR VOLUME LICENSE PRODUCT KEY CODE
	echo EXAMPLE: XXXXX-12345-1X2X3-ABCDE-XXXXX
	set /p PRD1_KEY=
	echo ************************************************
	GOTO :ADD

:PRD2_EDTN
	echo ************************************************
	echo PLEASE CHOOSE YOUR VISIO 2019  EDITION
	echo (1) VISIO STANDARD
	echo (2) VISIO PROFESSIONAL
	choice /c 12
	echo ************************************************
	
	:EDTN2_CHC1
		if %errorlevel%==1 (set PRD2_EDTN=VisioStd2019
		GOTO :PK2) else (GOTO :EDTN2_CHC2)
	:EDTN2_CHC2
		if %errorlevel%==2 (set PRD2_EDTN=VisioPro2019
		GOTO :PK2) else (GOTO :EDTN2_CHC1)
:PK2
	echo ************************************************
	echo PLEASE KEY IN YOUR VOLUME LICENSE PRODUCT KEY CODE
	echo EXAMPLE: XXXXX-12345-1X2X3-ABCDE-XXXXX
	set /p PRD2_KEY=
	echo ************************************************
	GOTO :ADD
	
:PRD3_EDTN
	echo ************************************************
	echo PLEASE CHOOSE YOUR PROJECT 2019  EDITION
	echo (1) PROJECT STANDARD
	echo (2) PROJECT PROFESSIONAL
	choice /c 12
	echo ************************************************
	:EDTN3_CHC1
		if %errorlevel%==1 (set PRD3_EDTN=ProjectStd2019
		GOTO :PK3) else (GOTO :EDTN3_CHC2)
	:EDTN3_CHC2
		if %errorlevel%==2 (set PRD3_EDTN=ProjectPro2019
		GOTO :PK3) else (GOTO :EDTN3_CHC1)
:PK3
	echo ************************************************
	echo PLEASE KEY IN YOUR VOLUME LICENSE PRODUCT KEY CODE
	echo EXAMPLE: XXXXX-12345-1X2X3-ABCDE-XXXXX
	set /p PRD3_KEY=
	echo ************************************************
	GOTO :ADD
	
:PRD4_EDTN
	echo ************************************************
	echo PLEASE KEY IN YOUR THE TYPE OF THE APP
	echo EXAMPLE: ACCESS2019 / EXCEL2019
	set /p PRD4_EDTN=
	echo ************************************************
	GOTO :PK4
:PK4
	echo ************************************************
	echo PLEASE KEY IN YOUR VOLUME LICENSE PRODUCT KEY CODE
	echo EXAMPLE: XXXXX-12345-1X2X3-ABCDE-XXXXX
	set /p PRD4_KEY=
	echo ************************************************
	GOTO :ADD

:PRD5_EDTN
	echo ************************************************
	echo PLEASE CHOOSE YOUR OFFICE 365  EDITION
	echo (1) OFFICE 365 PRO PLUS / ENTERPRISE
	echo (2) OFFICE 365 BUSINESS / BUSINESS PREMIUM
	choice /c 12
	echo ************************************************
	:EDTN5_CHC1
		if %errorlevel%==1 (set PRD5_EDTN=O365ProPlusRetail
		GOTO :PK5) else (GOTO :EDTN5_CHC2)
	:EDTN5_CHC2
		if %errorlevel%==2 (set PRD5_EDTN=O365BusinessRetail
		GOTO :PK5) else (GOTO :EDTN5_CHC1)
:PK5
	echo ************************************************
	echo PLEASE KEY IN YOUR LICENSE PRODUCT KEY CODE
	echo EXAMPLE: XXXXX-12345-1X2X3-ABCDE-XXXXX
	set /p PRD5_KEY=
	echo ************************************************

:ADD
	echo ************************************************
	echo DO YOU WANT TO INSTALL ANOTHER PRODUCT?
	echo 1. YES
	echo 2. NO
	choice /c 12
	echo ************************************************
	if %errorlevel%==1 (GOTO :PRD_SEL) else (GOTO :END)

:END
	if %PRD_5%==1 (GOTO :CFRMNO5) else (GOTO :CFRM4)
	:CFRMNO5
	echo *********************************
	echo Please Verify if This is all Your info.
	echo EDITION    :  %PRD4_EDTN%
	echo PLATFORM   :  %PFORM%
	echo PRODUCT KEY:  %PRD4_KEY%
	echo *********************************

:CFRM4
	if %PRD_4%==1 (GOTO :CFRMNO4) else (GOTO :CFRM3)
	:CFRMNO4
	echo *********************************
	echo Please Verify if This is all Your info.
	echo EDITION    :  %PRD4_EDTN%
	echo PLATFORM   :  %PFORM%
	echo PRODUCT KEY:  %PRD4_KEY%
	echo *********************************

:CFRM3
	if %PRD_3%==1 (GOTO :CFRMNO3) else (GOTO :CFRM2)
	:CFRMNO3
	echo *********************************
	echo Please Verify if This is all Your info.
	echo EDITION    :  %PRD3_EDTN%
	echo PLATFORM   :  %PFORM%
	echo PRODUCT KEY:  %PRD3_KEY%
	echo *********************************

:CFRM2
	if %PRD_2%==1 (GOTO :CFRMNO2) else (GOTO :CFRM1)
	:CFRMNO2
	echo *********************************
	echo Please Verify if This is all Your info.
	echo EDITION    :  %PRD2_EDTN%
	echo PLATFORM   :  %PFORM%
	echo PRODUCT KEY:  %PRD2_KEY%
	echo *********************************

:CFRM1
	if %PRD_1%==1 (GOTO :CFRMNO1) else (GOTO :CNFRM_EDT1)
	:CFRMNO1
	echo *********************************
	echo Please Verify if This is all Your info.
	echo EDITION    :  %PRD1_EDTN%
	echo PLATFORM   :  %PFORM%
	echo PRODUCT KEY:  %PRD1_KEY%
	echo *********************************

:CNFRM_EDT1
	echo ************************************************
	echo DO YOU WANT TO UPDATE SOME INFO?
	echo 1. YES
	echo 2. NO
	choice /c 12
	echo ************************************************
	if %errorlevel%==1 (GOTO :PRD_SEL) else (GOTO :CNFRM_EDT2)
:CNFRM_EDT2
	if %errorlevel%==2 (GOTO :CONT) else (GOTO :CNFRM_EDT1)

:CONT
	echo ^<Configuration^> > %file%
	echo ^<Add OfficeClientEdition^="PFORM" Channel^="CHNL"^> >> %file%

:PRD5
	if %PRD_5%==1 (GOTO :PRDNO5) else (GOTO :PRD4)
	:PRDNO5
	echo ^<Product ID^="PRODUCT5" PIDKEY^="PRD5_KEY"^> >> %file%
	echo ^<Language ID^="en-us" /^> >> %file%
	echo ^</Product^> >> %file%

:PRD4
	if %PRD_4%==1 (GOTO :PRDNO4) else (GOTO :PRD3)
	:PRDNO4
	echo ^<Product ID^="PRODUCT4" PIDKEY^="PRD4_KEY"^> >> %file%
	echo ^<Language ID^="en-us" /^> >> %file%
	echo ^</Product^> >> %file%

:PRD3
	if %PRD_3%==1 (GOTO :PRDNO3) else (GOTO :PRD2)
	:PRDNO3
	echo ^<Product ID^="PRODUCT3" PIDKEY^="PRD3_KEY"^> >> %file%
	echo ^<Language ID^="en-us" /^> >> %file%
	echo ^</Product^> >> %file%

:PRD2
	if %PRD_2%==1 (GOTO :PRDNO2) else (GOTO :PRD1)
	:PRDNO2
	echo ^<Product ID^="PRODUCT2" PIDKEY^="PRD2_KEY"^> >> %file%
	echo ^<Language ID^="en-us" /^> >> %file%
	echo ^</Product^> >> %file%

:PRD1
	if %PRD_1%==1 (GOTO :PRDNO1) else (GOTO :PRD_END)
	:PRDNO1
	echo ^<Product ID^="PRODUCT1" PIDKEY^="PRD1_KEY"^> >> %file%
	echo ^<Language ID^="en-us" /^> >> %file%
	echo ^</Product^> >> %file%

:PRD_END
	echo ^</Add^> >> %file%
	echo ^<Display Level^="Full" AcceptEULA^="TRUE" /^> >> %file%
	echo ^<Property Name^="AUTOACTIVATE" Value^="1" /^> >> %file%
	echo ^</Configuration^> >> %file%

:UPDT_CONFG
setlocal enableDelayedExpansion

::PLATFORM
set PFORM_old=PFORM
set PFORM_new=%PFORM%
(
   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
      set "line=%%b"
      if defined line set "line=!line:%PFORM_old%=%PFORM_new%!"
      echo(!line!
   )
) > %target%

)

::LICENSE TYPE
set LCNS_old=CHNL
set LCNS_new=%CHNL%
(
   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
      set "line=%%b"
      if defined line set "line=!line:%LCNS_old%=%LCNS_new%!"
      echo(!line!
   )
) > %source%

)

::PRODUCT 5
:PRD5_REP
	if %PRD_5%==1 (GOTO :REP_PRD5) else (GOTO :PRD4_REP)
	:REP_PRD5
		set EDTN1a=PRODUCT5
		set EDTN1b=%PRD5_EDTN%%LCNS_TYPE%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %target%

		)
		set EDTN1a=PRD5_KEY
		set EDTN1b=%PRD5_KEY%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %source%

		)

::PRODUCT 4
:PRD4_REP
	if %PRD_4%==1 (GOTO :REP_PRD4) else (GOTO :PRD3_REP)
	:REP_PRD4
		set EDTN1a=PRODUCT4
		set EDTN1b=%PRD4_EDTN%%LCNS_TYPE%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %target%

		)
		set EDTN1a=PRD4_KEY
		set EDTN1b=%PRD4_KEY%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %source%

		)


::PRODUCT 3
:PRD3_REP
	if %PRD_3%==1 (GOTO :REP_PRD3) else (GOTO :PRD2_REP)
	:REP_PRD3
		set EDTN1a=PRODUCT3
		set EDTN1b=%PRD3_EDTN%%LCNS_TYPE%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %target%

		)
		set EDTN1a=PRD3_KEY
		set EDTN1b=%PRD3_KEY%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %source%

		)


::PRODUCT 2
:PRD2_REP
	if %PRD_2%==1 (GOTO :REP_PRD2) else (GOTO :PRD1_REP)
	:REP_PRD2
		set EDTN1a=PRODUCT2
		set EDTN1b=%PRD2_EDTN%%LCNS_TYPE%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %target%

		)
		set EDTN1a=PRD2_KEY
		set EDTN1b=%PRD2_KEY%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %source%

		)


::PRODUCT 1
:PRD1_REP
	if %PRD_1%==1 (GOTO :REP_PRD1) else (GOTO :CREATE_CONFIGXML)
	:REP_PRD1
		set EDTN1a=PRODUCT1
		set EDTN1b=%PRD1_EDTN%%LCNS_TYPE%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %source%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %target%

		)
		set EDTN1a=PRD1_KEY
		set EDTN1b=%PRD1_KEY%
		(
		   for /F "tokens=1* delims=:" %%a in ('findstr /N "^" %target%') do (
			  set "line=%%b"
			  if defined line set "line=!line:%EDTN1a%=%EDTN1b%!"
			  echo(!line!
		   )
		) > %source%

		)

:CREATE_CONFIGXML
		
		1>"%dest%" (
		  for /f "delims=" %%e in ('findstr /n "^" "%source%"') do (
			set "line=%%e"
			setlocal enabledelayedexpansion
			set "line=!line:*:=!"

			if not "!line!" == "" (
			  echo(!line!
			)
			endlocal
		  )
		  )



:PWRSHL
powershell.exe -command "Invoke-WebRequest https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_11617-33601.exe -OutFile C:\odt\odt.exe"
if %errorlevel%==0 (GOTO :DOWNLOAD) else (GOTO :SHOW_ERROR)

:SHOW_ERROR
echo %errorlevel%
pause

:DOWNLOAD
Start /d C:\odt /b /wait odt.exe /extract:C:\ODT 
:CREAT_AUTORUN
set autorun=c:\odt\autorun.bat
set value=start /d "C:\ODT" /b /wait setup.exe /configure C:\ODT\configuration.xml
echo %value% > %autorun% 

tst&clss
:INSTALL
start /d "C:\odt" /b /wait setup.exe /configure configuration.xml



:EOC
exit
