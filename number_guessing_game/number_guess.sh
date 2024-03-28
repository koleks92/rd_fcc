#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n### Number Guessing Game ###\n"

# Generate random number between 1 and 1000
RANDOM_NUMBER=$((RANDOM % 1000 + 1))

# Get username
echo "Enter your username:"
read USERNAME

# Check database for given username
CHECK_USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

# If username exists
if [[ -z $CHECK_USERNAME ]]
then
  # Add new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Get data from user
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


# Guess the number game
echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

# Read until is integer
GUESS_NUMBER() {
  # Read number
  read GUESSED_NUMBER
  # Check if not integer
  if ! [[ $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then 
    # If not integer
    echo "That is not an integer, guess again:"
    GUESS_NUMBER
  fi
}

# Game logic
GUESS_NUMBER
while [ $GUESSED_NUMBER -ne $RANDOM_NUMBER ]
do
  # If bigger
  if [[ $GUESSED_NUMBER -gt $RANDOM_NUMBER ]]
  then 
    echo "It's lower than that, guess again:"
    ((NUMBER_OF_GUESSES++))
    GUESS_NUMBER
  else
    # If lower
    echo "It's higher than that, guess again:"
    ((NUMBER_OF_GUESSES++))
    GUESS_NUMBER
  fi
done

if [[ $RANDOM_NUMBER == $GUESSED_NUMBER ]]
then
  # Add one as last guess
  ((NUMBER_OF_GUESSES++))
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  # Add info to database
  if [[ -z $BEST_GAME ]]
  then
    # If first time played
    INSERT_DATA=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 1, $NUMBER_OF_GUESSES)")
  else
    # If recurring user
    # Add one game played and update database
    ((GAMES_PLAYED++))
    INSERT_DATA=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'")
    # Check if highscore if beat
    if [[ $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
    then
      INSERT_DATA=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
    fi
  fi
fi

# Made by koleks92