#!/bin/bash

# shell : || logical or, | logical and
# curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "img" | grep -o "pic\w\+.png"
declare -A arr
arr["pic76.png"]="Mainly-Cloudy"

# echo ${arr["pic76.png"]}

PICNAME=$(curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "img" | grep -o "pic\w\+.png")
cd img
if [ ! -f $PICNAME ]; then
    wget http://rss.weather.gov.hk/img/$PICNAME
fi
# feh -x $PICNAME
notify-send -i ~/.i3/img/$PICNAME ${arr[$PICNAME]}

# curl -s http://www.hko.gov.hk/contente.htm | grep "pic76" # | grep "content_elements_v2" | grep "pic"
echo ""
# forcast
curl -s http://rss.weather.gov.hk/rss/SeveralDaysWeatherForecast.xml | grep -A 1 'Weather\|Date' | grep '<br/>' | sed -r 's/^\s+//g;s/<br\/>//g'
