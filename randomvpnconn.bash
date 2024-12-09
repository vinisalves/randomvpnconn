#!/bin/bash

# Fetch and format the list of countries
formatted_countries=$(nordvpn countries | tr '\n' ' ' | sed 's/ \+/ /g' | sed 's/^ //;s/ $//' | tr '[:upper:]' '[:lower:]')
countries_array=($formatted_countries)

# Function to randomly select a country
connect_random_country() {
  num_countries=${#countries_array[@]}
  random_index=$((RANDOM % num_countries))
  random_country=${countries_array[$random_index]}
  echo "Connecting to a random country: $random_country"
  nordvpn connect "$random_country"
}

# Parse arguments
while getopts "c:" opt; do
  case $opt in
    c)
      selected_country=$(echo "$OPTARG" | tr '[:upper:]' '[:lower:]')
      ;;
    *)
      echo "Usage: $0 [-c country]"
      exit 1
      ;;
  esac
done

# If a country is specified, connect to it; otherwise, use the random logic
if [ -n "$selected_country" ]; then
  if [[ " ${countries_array[*]} " =~ " ${selected_country} " ]]; then
    echo "Connecting to: $selected_country"
    nordvpn connect "$selected_country"
  else
    echo "Error: $selected_country is not a valid country. Available countries are:"
    for country in "${countries_array[@]}"; do
        echo -e "\e[4;33m$country\e[0m"
    done
    exit 1
  fi
else
  connect_random_country
fi
