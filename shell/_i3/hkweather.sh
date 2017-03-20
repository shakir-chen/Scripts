#!/bin/bash

# curl -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'use utf8; if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; my @values=split(":",$1); if( $WEATHER eq "Sunny" || $WEATHER eq "Mostly Sunny" || $WEATHER eq "Partly Sunny" || $WEATHER eq "Intermittent Clouds" || $WEATHER eq "Hazy Sunshine" || $WEATHER eq "Hazy Sunshine" || $WEATHER eq "Hot") 

# echo "12"

WEATHER=$(curl -s http://rss.weather.gov.hk/rss/LocalWeatherForecast.xml | grep -oP '\K\w+(?= tonight and tomorrow morning)')
TEMP=$(curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "Sai" | grep -oP '\K\w+(?= degree)')    #degree of Saikung
HUMIDITY=$(curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "Humidity" | grep -oP '\K\w+(?= per cent)') #humidity

# if ( "$WEATHER" eq "Sunny" || "$WEATHER" eq "Mostly Sunny" || "$WEATHER" eq "Partly Sunny" || "$WEATHER" eq "Intermittent Clouds" || "$WEATHER" eq "Hazy Sunshine" || $WEATHER eq "Hazy Sunshine" || $WEATHER eq "Hot")

printf "$WEATHER "
# if [[ "$WEATHER" == "Sunny" ]]
# then
# sun=" "
# echo "$sun";
# fi

# # if ( $WEATHER eq "Mostly Cloudy" || $WEATHER eq "Cloudy" || $WEATHER eq "Dreary (Overcast)" || $WEATHER eq "Foggy")
# if [[ "$WEATHER" == "Foggy" ]]
# then
# cloud="A"
# printf "$cloud ";
# fi

# # if( $WEATHER eq "Showers" || $WEATHER eq "Mostly Cloudy w/ Showers" || $WEATHER eq "Partly Sunny w/ Showers" || $WEATHER eq "T-Storms"|| $WEATHER eq "Mostly Cloudy w/ T-Storms"|| $WEATHER eq "Partly Sunny w/ T-Storms"|| $WEATHER eq "Rain")
# if [[ "$WEATHER" == "Showers" ]]
# then
# rain=" "
# echo "$rain";
# fi

# # if( $WEATHER eq "Windy")
# if [[ "$WEATHER" == "Windy" ]]
# then
# wind=" "
# echo "$wind";
# fi

# # if($WEATHER eq "Flurries" || $WEATHER eq "Mostly Cloudy w/ Flurries" || $WEATHER eq "Partly Sunny w/ Flurries"|| $WEATHER eq "Snow"|| $WEATHER eq "Mostly Cloudy w/ Snow"|| $WEATHER eq "Ice"|| $WEATHER eq "Sleet"|| $WEATHER eq "Freezing Rain"|| $WEATHER eq "Rain and Snow"|| $WEATHER eq "Cold")
# if [[ "$WEATHER" == "Flurries" ]]
# then
# snow=";"
# echo "$snow"
# fi

# # if($WEATHER eq "Clear" || $WEATHER eq "Mostly Clear" || $WEATHER eq "Partly Cloudy"|| $WEATHER eq "Intermittent Clouds"|| $WEATHER eq "Hazy Moonlight"|| $WEATHER eq "Mostly Cloudy"|| $WEATHER eq "Partly Cloudy w/ Showers"|| $WEATHER eq "Mostly Cloudy w/ Showers"|| $WEATHER eq "Partly Cloudy w/ T-Storms"|| $WEATHER eq "Mostly Cloudy w/ Flurries" || $WEATHER eq "Mostly Cloudy w/ Snow")
# if [[ "$WEATHER" == "Clear" ]]
# then
# night=" "
# echo "$night";
# fi

echo "$TEMP°C-$HUMIDITY%"
# echo "$TEMP"

