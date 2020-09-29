#!/usr/bin/env python
# encoding: utf-8


# key='' ===>  I'm a poor coder
# import googlemaps
# from datetime import datetime

# gmaps = googlemaps.Client(key='A-XXX')

# now = datetime.now()
# directions_result = gmaps.directions("18.997739, 72.841280",
# "18.880253, 72.945137",
# mode="driving",
# avoid="ferries",
# departure_time=now
# )

# print(directions_result[0]['legs'][0]['distance']['text'])
# print(directions_result[0]['legs'][0]['duration']['text'])

import webbrowser
import time
import re
import selenium.webdriver as webdriver

def websearch(searchstr):
    # url="http://scholar.google.ch/scholar?hl=en&q={}".format(searchstr)
    # url="https://www.google.com/maps/dir/{}/Huawei+Tech.+Investment+Co.+Ltd.,+9/F,+Tower+6,+The+Gateway,+9+Canton+Road,+Tsim+Sha+Tsui,+Kowloon/@22.2999192,114.1700656,15z".format(searchstr)
    url="https://www.google.com/maps/dir/{}/The+Gateway,+9+Canton+Road,+Tsim+Sha+Tsui,+Kowloon/@22.2999192,114.1700656,15z".format(searchstr)
    b = webbrowser.get('firefox')
    b.open(url)

def initfirefox():
    return webdriver.Firefox()

def getdistance(firefox, searchstr):
    url="https://www.google.com/maps/dir/{}/The+Gateway,+9+Canton+Road,+Tsim+Sha+Tsui,+Kowloon/@22.2999192,114.1700656,15z".format(searchstr)
    firefox.get(url)

    element = firefox.find_elements_by_css_selector("div.travel-mode:nth-child(3) > button:nth-child(1)")
    time.sleep(5)
    element[0].click()
    time.sleep(5)
    # durationtime = firefox.find_elements_by_css_selector("section-directions-trip-0 > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1)")
    time_elem = firefox.find_elements_by_class_name("section-directions-trip-duration")

    wholetim_min=10000
    for time_elem_ii in time_elem:
        mystr = time_elem_ii.text
        mystr = re.sub(" ", "", mystr)
        ii = mystr.find("小時")
        jj = mystr.find("分")
        if ii != -1 and jj != -1:
            hour = int(mystr[:ii])
            minute = int(mystr[ii + 2:jj])
        elif ii == -1 and jj != -1:
            hour = 0
            minute = int(mystr[:jj])
        else:
            hour = int(mystr[:ii])
            minute = 0

        wholetim = hour * 60 + minute
        if wholetim < wholetim_min:
            wholetim_min = wholetim
    # print(wholetim_min)
    return wholetim_min

if __name__ == '__main__':
    myfirefox = initfirefox()
    getdistance(myfirefox, "東港城")
    getdistance(myfirefox, "黄埔花园")
    # websearch("黄埔花园")
