#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n#### Salon ####\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) Cut"
  echo -e "2) Wash"
  echo -e "3) Trim"
  echo -e "4) Exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SERVICE_MENU 1 ;;
    2) SERVICE_MENU 2 ;;
    3) SERVICE_MENU 3 ;;
    4) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

SERVICE_MENU() {
  # Get a service_id
  SERVICE_ID_SELECTED="$1"

  # Get a customer phone number
  echo -e "\nPlease enter your phone number: "
  read CUSTOMER_PHONE

  # Get a customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer doesnt exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # Get a customer name
    echo -e "\nPlease enter your name: "
    read CUSTOMER_NAME
    # Add customer to database
    ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  
  # Get a service_time
  echo -e "\nPlease enter time of your visit:"
  read SERVICE_TIME

  # Get a customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Add into appointments table
  ADD_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # If adding appointment didn't work
  if [[ -z ADD_NEW_APPOINTMENT ]]
  then
    MAIN_MENU "\There has been an error. Please try again"
  else
    # Get a service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

EXIT() {
  echo -e "\nThank you for stopping in. Please come back later\n"
}


MAIN_MENU