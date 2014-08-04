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
last_exercise=${exercises[${#exercises[@]}-1]}

for exercise in "${exercises[@]}"
do
  output $exercise
  sleep 30

  if [ "$exercise" != "$last_exercise" ]
  then
    output "Break!"
    sleep 10
  fi
done

output "Done!"
