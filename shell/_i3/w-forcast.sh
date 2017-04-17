#!/bin/bash

# shell : || logical or, | logical and
# curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "img" | grep -o "pic\w\+.png"
declare -A arr
arr["pic76.png"]="Mainly-Cloudy"
arr["pic62.png"]="Small-Rain"
arr["pic60.png"]="Cloudy"
arr["pic52.png"]="Sunny-Intervals"
arr["pic63.png"]="Rain"
arr["pic51.png"]="Sunny-Period"
# arr["pic52.png"]=""

# echo ${arr["pic76.png"]}

PICNAME=$(curl -s http://rss.weather.gov.hk/rss/CurrentWeather.xml | grep "img" | grep -o "pic\w\+.png")
echo $PICNAME
cd img
if [ ! -f $PICNAME ]; then
    wget http://rss.weather.gov.hk/img/$PICNAME
fi
# feh -x $PICNAME
if [ ${arr[$PICNAME]} ]; then
    notify-send -i ~/.i3/img/$PICNAME ${arr[$PICNAME]}
else
    echo "no arribution for this picture"
    firefox http://www.hko.gov.hk/contente.htm
fi

# curl -s http://www.hko.gov.hk/contente.htm | grep "pic76" # | grep "content_elements_v2" | grep "pic"
echo ""
# forcast
curl -s http://rss.weather.gov.hk/rss/SeveralDaysWeatherForecast.xml | grep -A 1 'Weather\|Date' | grep '<br/>' | sed -r 's/^\s+//g;s/<br\/>//g'
