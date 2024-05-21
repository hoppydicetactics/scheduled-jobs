#!/usr/bin/env bash

VOTES=$1
MAP=$2
declare -a USERS

# Transform string into array containing participants
VOTES=${VOTES#*[}
VOTES=${VOTES%]*}
IFS=', ' read -ra PARTICIPANTS <<< "$VOTES"

# Map and return participants if more than 1
if [[ ${#PARTICIPANTS[@]} -gt 1 ]]
then
  for PARTICIPANT in "${PARTICIPANTS[@]}"
  do
    MAPPED_USER="$(jq -e --raw-output --arg key "$PARTICIPANT" '.[$key] | select (.!=null)' <<< "$MAP")"
    if [[ -n $MAPPED_USER ]]
    then
      USERS+=("<@${MAPPED_USER}>")
    else
      USERS+=("${PARTICIPANT}")
    fi
  done
fi  

printf '%s, ' "${USERS[@]}"
