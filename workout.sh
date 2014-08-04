#!/bin/sh

command_exists() {
 return `command -v $1 > /dev/null`
}

output() {
  #check for 'say' which is found in osx
  if command_exists say; then
    say $@
    return
  fi

  #check for espeak which is the open source alternative
  if command_exists espeak; then
    echo $@ | espeak
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
)

for i in $(seq 0 $((${#exercises[@]} - 1)))
do
  output "prepare for "${exercises[$i]}
  sleep 1
  output "Go!"
  sleep 30

  if [ ${break_duration[$i]} -gt 0 ]
  then
    output "Break!"
    sleep ${break_duration[$i]}
  fi
done

output "Done!"
