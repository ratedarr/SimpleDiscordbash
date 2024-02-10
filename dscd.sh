#!/bin/bash
## Helped by chatgpt3 
### usage -###
# dscd -channelname -red -u username -m "message here,  \` code  here \` \`\`\` block code here \`\`\` >>> quote block "
# dscd -channelname -m "message" -u username -red 
################################
##### Define the channels  ####
logs="https://discord.com/api/webhooks/d/d"
fail="https://discord.com/api/webhooks/d/d"
media="https://discord.com/api/webhooks/d/d-LM4RxKB4FGZ"
status="https://discord.com/api/webhooks/d/d"
todo="https://discord.com/api/webhooks/d/d"
fubar="https://discord.com/api/webhooks/d/d"
# newchannle-"https://discord.com/api/webhooks/xx/xx" 
## add more here
##############################################
#########    Define the avatars ################
green="https://better-default-discord.netlify.app/Icons/Blast-Green.png"
red="https://better-default-discord.netlify.app/Icons/Blast-Red.png"
blue="https://better-default-discord.netlify.app/Icons/Blast-Blue.png"
black="https://better-default-discord.netlify.app/Icons/Blast-Black.png"
default="https://better-default-discord.netlify.app/Icons/Solid-Black.png"
nothing="https://raw.githubusercontent.com/norrml/extras/main/graydiscord.png"

#####  Default values #####
webhook_url="$todo"
avatar="$nothing"
message="||‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎ ‏‏‎ ‎ ||"
username="$(whoami)"

##### NEED TO ADD New channels and avatars  here too ######
while [[ $# -gt 0 ]]; do
  case "$1" in
    -logs) webhook_url="$logs"; shift ;;
    -media) webhook_url="$media"; shift ;;
    -status) webhook_url="$status"; shift ;;
    -todo) webhook_url="$todo"; shift ;;
    -fail) webhook_url="$fail"; shift ;;
	-fubar) webhook_url="$fubar"; shift ;;
   # -newchannel) webhook_url="$newchannel"; shift ;;
    -m) message="$2"; shift 2 ;;
    -u) username="$2"; shift 2 ;;
    -red) avatar="$red"; shift ;;
    -blue) avatar="$blue"; shift ;;
    -green) avatar="$green"; shift ;;
    -black) avatar="$black"; shift ;;
    *) echo "Invalid option: $1"; exit 1 ;;
  esac
done
# Check if required arguments are provided
if [ -z "$webhook_url" ] || [ -z "$message" ] || [ -z "$username" ]; then
  echo "Missing required arguments. Usage: ./dscd -channelname -m message -u username [-red | -blue | -green]"
  exit 1
fi

# Prepare JSON payload
json_payload='{
  "username": "'"$username"'",
  "content": "'"$message"'",
  "avatar_url": "'"$avatar"'"
}'

# Send the request using curl
curl -H "Content-Type: application/json" -X POST -d "$json_payload" "$webhook_url"

## Thank you CHATGPT ##
