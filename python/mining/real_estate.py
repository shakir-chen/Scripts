#!/usr/bin/env python
# encoding: utf-8

import pandas as pd
import re

from bs4 import BeautifulSoup
import requests

import selenium.webdriver as webdriver
import time
import webbrowser
import pandas as pd
import os
import numpy as np

from google import initfirefox, getdistance

def moneyexchage(money):
    money=re.sub(",|\$","",money)
    country=re.search(r"([A-Za-z]+)",money).group(0)
    moneynum=re.search(r"([0-9]+)",money).group(0)

    if country=="RMB":
        ratio=1.14
    elif country=="US":
        ratio=7.79
    elif country=="HK":
        ratio=1.0

    return int(moneynum)*ratio

def estate_init():
    if os.path.exists("./hkestate.xlsx"):
        x1 = pd.ExcelFile("hkestate.xlsx")
        df=x1.parse("Sheet1")
    else:
        # df = pd.DataFrame(columns=('Estate', 'U-Price (w/feet)', 'Change (%)', 'Age (Year)', 'Traffic (min)'))
        df = pd.DataFrame(columns=('Estate', 'U-Price', 'Change', 'Age', 'Traffic'))
    return df

def estate_rec(df, name, price_netarea, ratio, year, durationtime):
    rowii = df.loc[df['Estate'] == name]
    if len(rowii) == 0:
        if len(name) < 4:
            showname = name + "\t"
        else:
            showname = name
        print("{}\t{:2.1f}w\t{:1.0f}%\t{}\t{}min".format(showname, price_netarea/10000., ratio, 2020-year, durationtime))         # make it memoriable
        new_row = {'Estate':name, 'U-Price':price_netarea / 10000., 'Change':ratio, 'Age':2020-year, 'Traffic':durationtime}
        df = df.append(new_row, ignore_index=True)
    else:
        print("{}\t{:2.1f}w\t{:1.0f}%\t{}\t{}min".format(name, price_netarea/10000., ratio, 2020-year, durationtime))         # make it memoriable
        df["Traffic"][rowii.index[0]]=durationtime
    return df

def estate_check(df, name):     # exist: true
    if len(df['Estate']) == 0:
        return False
    rowii = df.loc[df['Estate'] == name]
    if len(rowii) == 0:
        return False
    if len(rowii) == 1:
        trafic_val = float(rowii["Traffic"])
        if trafic_val  < 10 or trafic_val > 500:
            return False
    return True

def estate_save(df):
    writer=pd.ExcelWriter('hkestate.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()


watchlist={"藍灣半島": 2001, "海怡半島":1991, "黃埔花園":1985, "海逸豪園": 1998, "名城":2010, "珀麗灣":2002,  "譽．港灣":2010, "YohoTown": 2004, "華景山莊":1984, "映灣園":2002, "東港城":1997, "新都城":2000,  \
           "泓景臺": 2004}
# watchlist={"藍灣半島": 2001}
def Price():        # 中原地产数据
    url="http://www1.centadata.com/cci/cci.htm"
    soup = BeautifulSoup(requests.get(url).content,"lxml")
    # for section in soup.find_all("table", attrs={'id': "tblCCIEstateInfo"}):       # first section is principal investigator
    myfirefox = initfirefox()
    df = estate_init()

    print("Estate\t\tU-Price (w/feet)\tChange (%)\tAge (Year)\tTraffic (min)")         # make it memoriable
    for section in soup.find_all("tr"):       # first section is principal investigator
        item=section.find_all("td", attrs={'class': "main_td"})
        ii = 0
        while ii<len(item):
            mystr = item[ii].text
            newstr = re.sub("\n|\xa0| |,", "", mystr)
            if newstr in watchlist:
                name = newstr
                year = watchlist[name]
                if estate_check(df, name):      # exist
                    ii += 3
                    continue
                try:
                    durationtime= getdistance(myfirefox, name)
                    # durationtime= 0
                except:
                    continue

                price_grossarea = item [ii+1].text
                price_grossarea = re.sub("\n|\xa0| |,", "", price_grossarea)
                price_grossarea = float(price_grossarea)
                price_netarea = item[ii+2].text
                price_netarea = re.sub("\n|\xa0| |,", "", price_netarea)
                price_netarea = float(price_netarea)

                ratio = item[ii+3].text
                ratio = re.sub("\n|\xa0| |,", "", ratio)
                ratio = float(ratio[:-1])       # don't include %
                ratio_font=item[ii+3].find_all("font")[0]
                if ratio_font.attrs["color"] == "red":      # negative, blue positive
                    ratio = -ratio

                df = estate_rec(df, name, price_netarea, ratio, year, durationtime)
            else:
                ii += 3
            ii += 1
    estate_save(df)

def PrintDF():        # 中原地产数据
    df = estate_init()
    df = df.sort_values(by='U-Price', ascending=False)
    for ii, dfii in df.iterrows():
        xqindex = model(dfii["Age"], dfii["Traffic"], dfii["U-Price"])
        if len(dfii["Estate"]) < 4:
            # print("{}\t\t{:2.1f}w\t{:1.0f}%\t{}\t{}min".format(dfii["Estate"], dfii["U-Price"], dfii["Change"], dfii["Age"], dfii["Traffic"]))
            print("{}\t\t{}\t{}min\t{:2.1f}w\t{:1.0f}%\t{:.1f}".format(dfii["Estate"], dfii["Age"], dfii["Traffic"], dfii["U-Price"], dfii["Change"], xqindex))
        else:
            print("{}\t{}\t{}min\t{:2.1f}w\t{:1.0f}%\t{:.1f}".format(dfii["Estate"], dfii["Age"], dfii["Traffic"], dfii["U-Price"], dfii["Change"], xqindex))
    figshow(df["Age"], df["Traffic"], df["U-Price"])

def figshow(age, traffic, price):     # predict_price = f(age, traffic)
    import matplotlib.pyplot as plt
    print(sigmoid(age/75))
    # plt.plot(traffic/60 + 0.5*age/75, price, "o-")
    plt.plot(traffic/60 + sigmoid(age/75), price, "o-")
    plt.savefig("curvefig.pdf")


def model(age, traffic, price):     # predict_price = f(age, traffic)
    xq_index =  age + traffic/60 + price
    return xq_index

def sigmoid(x):
    S = 1 / (1+ np.exp(-x))
    return S

def UProj2():
    url="http://www1.centadata.com/cci/cci.htm"
    soup = BeautifulSoup(requests.get(url).content,"lxml")

    startnum=0

    rec=["MainProj-Num","Main-Funding","CoProj-Num","Co-Funding"]
    for profii in range(startnum,len(df)):
        name=df["Name"][profii]
        url=df["U-Funding"][profii]
        print(name,"\t",url)

        try:
            soup = BeautifulSoup(requests.get(url).content,"lxml")
        except:
            break
        hascoproj=True
        for section in soup.find_all("p", attrs={'style': "margin-bottom:5px;"}):       # first section is principal investigator
            # import pdb
            # pdb.set_trace()
            mainfundflag=True

            nextNode = section

            fundsum=0
            index=0

            termflag=True
            while termflag:
                nextNode = nextNode.nextSibling
                try:
                    tag_name = nextNode.name
                except AttributeError:
                    tag_name = "p"      # no co-program
                    hascoproj=False

                if tag_name == "div":
                    # for activeprojin in soup.find_all("div", attrs={'class':"result record1 "}):
                        # print(activeprojin)
                        money=nextNode.findAll('td')[2:3][0].text
                        print(money)
                        index += 1
                        fundsum += moneyexchage(money)
                    # print(nextNode.string)
                elif tag_name == "p":
                    df.loc[profii,rec[0]]=index
                    df.loc[profii,rec[1]]=fundsum

                    termflag = False
                else:
                    print("*****")
                    # break

        if hascoproj :
            for section in soup.find_all("p", attrs={'style': "margin-bottom:5px;margin-top:30px;"}):       # first section is principal investigator
                nextNode = section
                fundsum=0
                index=0

                termflag=True
                while termflag:
                    nextNode = nextNode.nextSibling
                    try:
                        tag_name = nextNode.name
                    except AttributeError:
                        tag_name = "p"      # no co-program
                        hascoproj=False

                    if tag_name == "div":
                        # for activeprojin in soup.find_all("div", attrs={'class':"result record1 "}):
                            # print(activeprojin)
                            money=nextNode.findAll('td')[2:3][0].text
                            print(money)
                            index += 1
                            fundsum += moneyexchage(money)
                        # print(nextNode.string)
                    elif tag_name == "p":
                        df.loc[profii,rec[2]]=index
                        df.loc[profii,rec[3]]=fundsum
                        termflag = False
                    else:
                        print("*****")
                    # break

    writer=pd.ExcelWriter('ece-faculty-5.0.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return



def UProj(df):
    startnum=4
    rec=["Proj-Num","Funding"]

    for profii in range(startnum,len(df)):
        name=df["Name"][profii]
        print(name)
        html=df["U-Funding"][profii]

        b = webbrowser.get('firefox')
        try:
            b.open(html)
        except:
            break

        x=input("Proj Info= ")      # input list
        if x == "s":
            break
        elif x=="n":
            continue
        elif x=="c":        # change the html
            url = "https://www.google.com.tr/search?q={}".format(name + " HKUST Scholarly Publications")
            # url="http://scholar.google.ch/scholar?hl=en&q={}".format(searchstr)
            b.open(url)

            url0=input("Publication Web = ")
            df.loc[profii,"U-Publications"]=url0
            url1=input("Funding Web = ")
            df.loc[profii,"U-Funding"]=url1

            b.open(url0)
            x=input("Info = ")


        money=re.split("\s|\t",x)

        fundsum=0
        index=0

        for eachmoney in money:
            if not eachmoney == "":     # RMB2,000,000, HK$696,029, US$149,342
                eachmoney=re.sub(",|\$","",eachmoney)
                country=re.search(r"([A-Za-z]+)",eachmoney).group(0)
                moneynum=re.search(r"([0-9]+)",eachmoney).group(0)

                if country=="RMB":
                    ratio=1.14
                elif country=="US":
                    ratio=7.79
                elif country=="HK":
                    ratio=1.0
                else:
                    break

                index += 1
                fundsum += int(moneynum)*ratio

        print("Index Count:",index,"Funding:",fundsum)
        df.loc[profii,rec[0]]=index
        # x=input("Fundings = ")
        df.loc[profii,rec[1]]=fundsum


    writer=pd.ExcelWriter('ece-faculty-5.0.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return

def URec2(df):
    startnum=23

    rec=["U-BookChapter","U-Book"]

    for profii in range(startnum,len(df)):
        name=df["Name"][profii]
        print(name)
        html=df["U-Publications"][profii]

        b = webbrowser.get('firefox')
        try:
            b.open(html)
        except:
            break

        x=input("BookChapter Book= ")
        if x == "s":
            break
        elif x=="n":
            continue
        elif x=="c":        # change the html
            url = "https://www.google.com.tr/search?q={}".format(name + " HKUST Scholarly Publications")
            # url="http://scholar.google.ch/scholar?hl=en&q={}".format(searchstr)
            b.open(url)

            url0=input("Publication Web = ")
            df.loc[profii,"U-Publications"]=url0
            url1=input("Funding Web = ")
            df.loc[profii,"U-Funding"]=url1

            b.open(url0)
            x=input("Info = ")


        score=re.split("\s|\t",x)

        print(score)
        index=0
        for ii in range(0,len(score)):
            if score[ii]=="":
                continue
            else:
                df.loc[profii,rec[index]]=score[ii]
                index += 1

    writer=pd.ExcelWriter('ece-faculty-5.0.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return




def URec(df):
    startnum=23

    rec=["U-Total","U-Conf","U-Journal","U-Patent"]

    for profii in range(startnum,len(df)):
        name=df["Name"][profii]
        print(name)
        html=df["U-Publications"][profii]

        b = webbrowser.get('firefox')
        try:
            b.open(html)
        except:
            break

        x=input("Info = ")
        if x == "s":
            break
        elif x=="n":
            continue
        elif x=="c":        # change the html
            url = "https://www.google.com.tr/search?q={}".format(name + " HKUST Scholarly Publications")
            # url="http://scholar.google.ch/scholar?hl=en&q={}".format(searchstr)
            b.open(url)

            url0=input("Publication Web = ")
            df.loc[profii,"U-Publications"]=url0
            url1=input("Funding Web = ")
            df.loc[profii,"U-Funding"]=url1

            b.open(url0)
            x=input("Info = ")


        score=re.split("\s|\t",x)

        print(score)
        index=0
        for ii in range(0,len(score)):
            if score[ii]=="":
                continue
            else:
                df.loc[profii,rec[index]]=score[ii]
                index += 1

    writer=pd.ExcelWriter('ece-faculty-5.0.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return


def UWeb(df):
    # url0="http://repository.ust.hk/ir/AuthorProfile/"       # sin-johnny-k-o
    # url0="http://repository.ust.hk/ir/AuthorProfile/kwok-hoi-sing/Projects"
    startnum=0
    for profii in range(startnum,len(df)):
        name=df["Name"][profii]
        print(name)
        try:
            name=re.sub('\.','',name)
            namelist=re.split('\s|-',name)
            # for word in namelist:
            lastname=namelist[-1].lower()
            firstname="-".join(namelist[:-1]).lower()
            url0="http://repository.ust.hk/ir/AuthorProfile/"+lastname+"-"+firstname
            url1="http://repository.ust.hk/ir/AuthorProfile/"+lastname+"-"+firstname+"/Projects"
            print(url0)
            print(url1)
            df.loc[profii,"U-Publications"]=url0
            df.loc[profii,"U-Funding"]=url1
        except:
            break

    writer=pd.ExcelWriter('ece-faculty-5.0.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()
    return

if __name__=="__main__":
    Price()
    # PrintDF()

    # UWeb(df)
    # URec(df)
    # UProj2(df)
    # URec2(df)       # Bookchapter

