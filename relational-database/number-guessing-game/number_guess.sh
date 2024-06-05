#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#generate a random integer between 1 and 1000
NUMBER_TO_GUESS=$(( RANDOM % 1000 + 1 ))

#ask for username
echo "Enter your username:"
read USERNAME_ENTERED

#check if username already exists
USERNAME_DATABASE=$($PSQL "SELECT username FROM players WHERE username='$USERNAME_ENTERED';")
if [[ -z $USERNAME_DATABASE ]]
then
  #insert new username
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME_ENTERED');")
  echo "Welcome, $USERNAME_ENTERED! It looks like this is your first time here."
  #get player_id
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME_ENTERED';")
else
  #get player_id
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME_ENTERED';")
  #get previous details
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE player_id=$PLAYER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE player_id=$PLAYER_ID;")
  echo "Welcome back, $USERNAME_ENTERED! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#declare initial values of variables to be used inside the loop
GUESS=0
COUNTER=0

echo "Guess the secret number between 1 and 1000:"
while [[ $GUESS != $NUMBER_TO_GUESS ]]
do
  read GUESS
  (( COUNTER++ ))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -lt $NUMBER_TO_GUESS ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $NUMBER_TO_GUESS ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $COUNTER tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
    fi
  fi
done
#insert game record
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player_id,number_of_guesses,magic_number) VALUES($PLAYER_ID,$COUNTER,$NUMBER_TO_GUESS);")