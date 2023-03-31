#!/bin/bash

# This script rebuilds Docker containers with the provided environment file
# Optionally, you can include the '-d' flag to delete running and stopped containers

# Parse command line options
while getopts "d" opt; do
  case ${opt} in
    d )
      delete_containers=true
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done

shift $((OPTIND -1))

# Set the environment file path
ENV_FILE="$1"

# Check if the environment file path is provided
if [ -z "$ENV_FILE" ]
then
    echo "Please provide an environment file path as an argument"
    exit 1
fi

# Delete running and stopped containers if the '-d' flag is included
if [ "$delete_containers" = true ]
then
  # List all Docker containers, including those that are stopped
  containers=$(sudo docker ps -aq)

  if [ -n "$containers" ]; then
    sudo docker rm $containers
    echo "All Docker containers have been removed."
  else
    echo "There are no Docker containers to remove."
  fi
fi

# Rebuild the containers with no cache
sudo docker compose build --no-cache

# Start the containers with the provided environment file
sudo docker compose --env-file "$ENV_FILE" up
