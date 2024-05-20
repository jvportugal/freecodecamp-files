#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE games,teams;")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    #Get team_id for winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    if [[ -z $WINNER_ID ]]
    then
      #Insert data into 'teams' table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      #Get new team_id for winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    fi
  
    #Get team_id for opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    if [[ -z $OPPONENT_ID ]]
    then
      #Insert data into 'teams' table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      #Get new team_id for opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    fi
    #Insert data into 'games' table
    INSERT_OPPONENT_GOALS_RESULT=$($PSQL "INSERT INTO games(year,winner_id,opponent_id,winner_goals,opponent_goals,round) VALUES($YEAR,$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS,'$ROUND');")
  fi
done