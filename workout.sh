function output() {
  which say > /dev/null
  if [ $? -eq 0 ]
  then
    say $@
    return
  fi

  which espeak > /dev/null
  if [ $? -eq 0 ]
  then
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

for exercise in "${exercises[@]}"
do
  output $exercise
  sleep 30
  output "Break!"
  sleep 10
done
output "Done!"
