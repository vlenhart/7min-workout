#!/usr/bin/env bash

command_exists() {
  return "$(command -v "$1" > /dev/null)"
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
  if [ ${prepare_duration[$i]} -gt 0 ]
  then
    output "prepare for "${exercises[$i]}
    sleep ${prepare_duration[$i]}
    output "Go!"
  else
    output ${exercises[$i]}
  fi

  sleep ${exercises_duration[$i]}

  if [ ${break_duration[$i]} -gt 0 ]
  then
    output "Break!"
    sleep ${break_duration[$i]}
  fi
done

output "Done!"
