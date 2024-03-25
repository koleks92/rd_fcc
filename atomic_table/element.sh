PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  re='^[0-9]+$'
  if [[ $1 =~ $re ]]
  then
    # Check for atomic number
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
  else
    # Check for symbol or name
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi

  if [[ -z $NAME ]]
    then
      echo "I could not find that element in the database."
    else
    # Get all needed properties
    PROPERTIES=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties JOIN elements ON properties.atomic_number = elements.atomic_number JOIN types ON properties.type_id = types.type_id WHERE name = '$NAME'")
    # Divide into separate values
    IFS="|"
    read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING BOILING <<< $PROPERTIES
    # Echo output
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi
