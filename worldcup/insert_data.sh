#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# INSERT TEAM NAMES
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER != 'winner' ]]
then
  if [ -z $($PSQL "SELECT name FROM teams WHERE name = '$WINNER'") ]
  then
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
  fi
fi
if [[ $OPPONENT != 'opponent' ]]
then
  if [ -z $($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'") ]
  then
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
  fi
fi
done

# INSERT GAMES
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != 'year' ]]
then
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"
  echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, '$WINNER_GOALS', '$OPPONENT_GOALS')")"
fi
done