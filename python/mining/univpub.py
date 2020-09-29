#!/usr/bin/env python
# encoding: utf-8

import pandas as pd
import re

from bs4 import BeautifulSoup
import requests

import selenium.webdriver as webdriver
import time
import webbrowser

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

def UProj2(df):
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
    x1=pd.ExcelFile('ece-faculty-5.0.xlsx')
    df=x1.parse("Sheet1")
    # UWeb(df)
    # URec(df)
    # UProj2(df)
    URec2(df)       # Bookchapter

