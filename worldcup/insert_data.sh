#! /bin/bash

PSQL="psql --username=(your_user) --dbname=worldcup -t --no-align -c"

echo "$($PSQL "TRUNCATE TABLE games, teams")"
declare -a NAME_TEAMS=()

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT_WINNER WINNER_GOALS OPPONENT_GOALS
do
  if [ $YEAR != 'year' ]
  then
    if ! [[ " ${NAME_TEAMS[@]} " =~ " $WINNER " ]]
    then
      NAME_TEAMS+=("$WINNER")
      echo "$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")"
      echo "INSERT 0 1"
    fi

    if ! [[ " ${NAME_TEAMS[@]} " =~ " $OPPONENT_WINNER " ]]
    then
      NAME_TEAMS+=("$OPPONENT_WINNER")
      echo "$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT_WINNER')")"
      echo "INSERT 0 1"
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT_WINNER WINNER_GOALS OPPONENT_GOALS
do
  if [ $YEAR != 'year' ]
  then
    WINNER_ID=$($PSQL  "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL  "SELECT team_id FROM teams WHERE name='$OPPONENT_WINNER'")
    
    echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  fi
done