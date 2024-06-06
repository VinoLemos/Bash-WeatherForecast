#!/bin/bash

# Make a request to an IP geolocation API
response=$(curl -s http://ip-api.com/json)

# Check if the response status is success
status=$(echo "$response" | grep -o '"status":"[^"]*' | grep -o '[^"]*$')

# Extract relevant information from the response if status is success
if [[ "$status" == "success" ]]; then
    city=$(echo "$response" | grep -o '"city":"[^"]*' | grep -o '[^"]*$' | tr ' ' '-' )
    region=$(echo "$response" | grep -o '"region":"[^"]*' | grep -o '[^"]*$')
    country=$(echo "$response" | grep -o '"country":"[^"]*' | grep -o '[^"]*$')
    countryCode=$(echo "$response" | grep -o '"countryCode":"[^"]*' | grep -o '[^"]*$')

    # Fetch weather data using curl and display
    curl wttr.in/"$city"
else
    # Display error message
    echo "Error: Unable to fetch geographical information. Please try again later."
fi

