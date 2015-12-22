#!/usr/bin/env bash

command_exists() {
  command -v "$1" > /dev/null
  return $?
function countdown {
    local _time="$1"
    while (( 0 <= $_time ))
    do
        printf "\r%02d:%02d" $(( (_time/60)%60)) $((_time%60))
        _time=$((_time - 1))
        sleep 1
    done
    printf "\r%5s\r"
}

output() {
  #check for 'say' which is found in osx
  if command_exists say; then
    say "$@"
    return
  fi

  #check for espeak which is the open source alternative
  if command_exists espeak; then
    echo "$@" | espeak
    return
  fi

  echo "No speech synthesis found: please install eSpeak http://espeak.sourceforge.net/"
  exit 1
}

exercises=(
  "Jumping jacks!"
  "Wall sit!"
  "Push-ups!"
  "Crunches!"
  "Step-up!"
  "Squats!"
  "Tricep dips!"
  "Plank!"
  "High knees!"
  "Lunges!"
  "Push-up and rotation!"
  "Side plank!"
  "Switch sides!"
)

prepare_duration=(
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  1
  0
)

exercises_duration=(
  30
  30
  30
  30
  30
  30
  30
  30
  30
  30
  30
  15
  15
)

break_duration=(
  10
  10
  10
  10
  10
  10
  10
  10
  10
  10
  10
  0
  0
)

for i in $(seq 0 $((${#exercises[@]} - 1)))
do
    if [[ 0 < ${prepare_duration[i]} ]]
    then
        output "Next up:" ${exercises[i]}
        sleep ${prepare_duration[i]}
        output "Go!"
    else
        output ${exercises[i]}
    fi

    countdown ${exercises_duration[i]}

    if [[ 0 < ${rest_duration[i]} ]]
    then
        output "Rest"
        countdown ${rest_duration[i]}
    fi
done

output "Done!"
