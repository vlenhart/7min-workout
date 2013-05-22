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
  "Push-ups!"
  "Side plank!"
)

for exercise in "${exercises[@]}"
do
  say $exercise
  sleep 30
  say "Break!"
  sleep 10
done
say "Done!"