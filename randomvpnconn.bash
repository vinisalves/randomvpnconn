#!/bin/bash
formatted_countries=$(nordvpn countries | tr '\n' ' ' | sed 's/ \+/ /g' | sed 's/^ //;s/ $//')
countries_array=($formatted_countries)
num_countries=${#countries_array[@]}
random_index=$((RANDOM % num_countries))
random_country=${countries_array[$random_index]}
nordvpn connect "$random_country"
