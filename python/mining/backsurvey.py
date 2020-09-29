#!/usr/bin/env python
# encoding: utf-8

import pandas as pd
import re

from bs4 import BeautifulSoup
import requests

import selenium.webdriver as webdriver
import time

def DBInit():       # Add Name From Text, Save as ECE_Prof.xlsx
    df = pd.DataFrame(columns=('Name', 'citations', '6Y-citations','h-index','6Y-h-index', 'i10-index','6Y-i10', 'Publications','5Y-Publications','5Y-Journal','5Y-Conf','5Y-Patent','Phd','MPhil','gscholar','ECEWeb'))

    # bibhtml_file=open("bib-ldquo-cor.html","r")
    textfile=open("prof.txt","r")
    lines=textfile.readlines()

    index=0
    for ii in range(0,len(lines)):
        # print(lines[ii].split('&ldquo;|,&rdquo|<em>|<\em>',4))
        if lines[ii][-3:] == "//\n" or lines[ii] == "\n":
            # print(lines[ii])
            continue
        else:
            line_temp=re.sub('\n','',lines[ii])
            # spldata=re.split('&ldquo;|&rdquo.+<em>|</em>',lines[ii])
            # spldata=re.split(',',lines[ii])
            spldata=re.split(',',line_temp)
            try:
                for jj in range(0,len(spldata)):
                    df.loc[index,"Name"]= re.sub('^\s','',spldata[jj])  #spldata[jj]
                    index=index+1
                    print(df.loc[jj,"Name"])        #spldata[jj]
            except:
                print(spldata)
                exit(-1)

        # df.loc[ii]=[,spldata]

    textfile.close()

    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

def ECEWeb(df,url,profii):       # Analyze ECE Web Biography, Google Scholar and Personal Homepage
    url0= 'http://www.ece.ust.hk' + url
    print(url0)
    df.loc[profii,"ECEWeb"]=url0

    # websoup=BeautifulSoup(requests.get('http://www.ece.ust.hk/ece.php/profile/facultydetail/chingtang').content,"lxml")
    websoup=BeautifulSoup(requests.get(url0).content,"lxml")
    for gscholar in websoup.select("td.p-details"):
        temp=gscholar.select_one("a")
        if (temp):
            if (temp.text == "Google Scholar Citation"):
                df.loc[profii,"gscholar"]=temp['href']
                # print(temp['href'])

    # for bio in websoup.select("div.content"):       # bio may
    #     print(bio.select_one("div").text)
    return


def WebInfoRec():       # Add Name From Text, Save as ECE_Prof.xlsx
    x1=pd.ExcelFile('ece-faculty.xlsx')
    df=x1.parse("Sheet1")
    # print(df[df["Name"] == "Tim Kwang Ting Cheng"].index.tolist())
    # exit(-1)

    soup=BeautifulSoup(requests.get('http://www.ece.ust.hk/ece.php/profile/listfaculty').content,"lxml")
    # print(soup)
    for proflink in soup.select("a.link"):
        # print(proflink)
        if ( proflink['href'][0:10] != "javascript" ):
            # print(proflink.text, "\t\t",proflink['href'])
            # print(profname.capitalize())
            profii=df[df["Name"] == proflink.text.title()].index.tolist()
            if profii :
                ECEWeb(df,proflink['href'],profii)

        # exit(-1)
        # print(link.select_one("a.link").href)

    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()
    return

def namematch(name,dbnamelist):
    name=re.sub('&rsquo;',"'",name)
    name=re.sub(' et al','',name)
    namewd=name.split();

    # print(namewd)
    for dbname in dbnamelist:
        # print("\t",dbname)
        dbnamewd=dbname.split()

        matchflag=0
        # Error: A. Kodi maybe miss: Avinash Karanth Kodi ;; solution: last name first, A. Kodi => A. -> first; A. K. Kodi, A, K, first two
        ii=len(namewd)
        if ii==len(dbnamewd):      # check word num first
            while ii>0 :
                ii=ii-1
                if "."==namewd[ii][-1]:       #last character is "."
                    if namewd[ii][0] == dbnamewd[ii][0]:
                        matchflag=matchflag+1
                        # print("2")
                    else:
                        # print("3")
                        break
                else:
                    # print("4")
                    if namewd[ii]==dbnamewd[ii]:      # the last name must be the same
                        # print("5")
                        matchflag=matchflag+1
        elif ii>0:
            try:
                if dbnamewd[-1] == namewd[-1]:
                    matchflag=matchflag+1
                    ii=0
                    jj=0
                    while ii<len(namewd)-1 :
                        if "."==namewd[ii][-1]:       #last character is "."
                            if namewd[ii][0] == dbnamewd[ii+jj][0]:
                                matchflag=matchflag+1
                                ii=ii+1
                            else:
                                jj=jj+1
                                if jj> len(dbnamewd)-len(namewd):
                                    break;
                        else:
                            if namewd[ii]==dbnamewd[ii+jj]:      # the last name must be the same
                                # print("5")
                                matchflag=matchflag+1
                                ii=ii+1
                            else:
                                jj=jj+1
                                if jj> len(dbnamewd)-len(namewd):
                                    break;
            except:
                print(dbnamewd)
                print(namewd)
                exit(-1)
        else:
            return ""

        # if matchflag==len(dbnamewd):
        if matchflag==len(namewd):
            return dbname
    return ""

def Student(stdtype):      # Student Statistically Analysis, stdtype: Phd or MPhil
    x1=pd.ExcelFile('ece-faculty.xlsx')
    df=x1.parse("Sheet1")

    if stdtype=="Phd":
        url='http://www.ece.ust.hk/ece.php/profile/listpg/phd'
    elif stdtype=="MPhil":
        url='http://www.ece.ust.hk/ece.php/profile/listpg/mphil'

    soup=BeautifulSoup(requests.get(url).content,"lxml")
    stdinfo =soup.select_one("table.ppl-list")      #.select_one("tbody")

    profnamelist=df['Name']

    index=0
    for person in stdinfo.select("tr"):
        # print(person)
        index=index+1
        try:
            supervisor=person.findAll('td')[6:7]
            profname=supervisor[0].text
            if profname != "":
                # print(supervisor[0].text)
                print(profname)
                proflist=profname.split("/")
                for eachprof in proflist:
                    ret=namematch(eachprof,profnamelist)
                    # profii=df[df["Name"] == ret].index.tolist()
                    profii=int(df[df["Name"] == ret].index.values)
                    # curval=df['Phd'][profii]
                    # print(curval)
                    # import pdb
                    # pdb.set_trace()
                    # if curval.empty():
                    if pd.isnull(df[stdtype][profii]):
                        df[stdtype][profii]=1
                        # df.loc("Phd",profii)=curval+1
                    else:
                        df[stdtype][profii] += 1
                    print(ret,df[stdtype][profii])
                    # exit(-1)
        except:
            continue

        # if index>2:
            # import pdb
            # pdb.set_trace()
            # for person in stdinfo.select("tr"):
    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer, 'Sheet1')
    writer.save()
    # <http://www.ece.ust.hk/ece.php/profile/listpg/mphil>
    # <http://www.ece.ust.hk/ece.php/profile/listpg/phd>
    return



def GoogleCitations():
    x1=pd.ExcelFile('ece-faculty.xlsx')
    df=x1.parse("Sheet1")

    itemseq=['citations', '6Y-citations','h-index','6Y-h-index', 'i10-index','6Y-i10']

    startnum = 0
    for profii in range(startnum,len(df)):
        print(profii)

        # url='https://scholar.google.com/citations?user=KaaF6ooAAAAJ&hl=en'
        url=df["gscholar"][profii]
        if pd.isnull(url):
            continue
        else:
            soup=BeautifulSoup(requests.get(url).content,"lxml")            # first one is error, doesn't know why
            print(df["Name"][profii])

        count=0
        for citeitem in soup.select("td.gsc_rsb_std"):
            print(itemseq[count],citeitem.text)
            df.loc[profii,itemseq[count]]=citeitem.text
            count += 1

    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return

def GoogleScholarPapers():
    x1=pd.ExcelFile('ece-faculty.xlsx')
    df=x1.parse("Sheet1")

    firefox=webdriver.Firefox()

    startnum=0
    for profii in range(startnum,len(df)):
        url=df["gscholar"][profii]
        if pd.isnull(url):
            continue
        # url="http://scholar.google.com.hk/citations?user=b1MfboEAAAAJ&hl=en" # https://scholar.google.com.hk/citations?user=t3mcfk0AAAAJ&hl=en
        # url="https://scholar.google.com.hk/citations?user=t3mcfk0AAAAJ&hl=en"

        # html=firefox.get("https://scholar.google.com.hk/citations?hl=en&user=t3mcfk0AAAAJ&view_op=list_works&sortby=pubdate")
        firefox.get(url)

        html=firefox.page_source
        soup = BeautifulSoup(html,"lxml")

        for yearlink in soup.select("a.gsc_a_a"):
            if yearlink.text == "Year" :
                print(yearlink['href'])
                url="https://scholar.google.com.hk" + yearlink['href']
                print(url)
                firefox.get(url)
            else:
                print(url)          # don't know whether the intial page is sorted by "Year" or not

        element=firefox.find_element_by_id("gsc_bpf_more")

        for ii in range(0,10):      # over click
            element.click()

            time.sleep(0.5)

            html=firefox.page_source
            soup = BeautifulSoup(html,"lxml")
            # for button in soup.find("button",attrs={'class':" gs_btn_smd"}):
            button = soup.find("button",attrs={'id':"gsc_bpf_more"})
            # print(button)
            if len(button["class"]) == 2:   #'',gs_btn_smd
                continue
            else:                           #'', gs_btn_smd, gs_dis
                break

        # Statistically analyze 5Y Publication Information
        index=0

        for yearitem in soup.select("td.gsc_a_y"):
            year=yearitem.select_one("span.gsc_a_h")
            try:
                if year:
                    print(year.text)
                    if int(year.text) > 2012:     # 2013-2017
                        index += 1
            except:
                continue

        print(index)
        df.loc[profii,'5Y-Publications']=index

        # Next Page if Available
        # element=firefox.find_element_by_id("gsc_bpf_next")
        # element.click()

        for title in soup.select("th.gsc_a_t"):
            num=title.findAll('span')[1:2]
            if num :
                numrange=num[0].text.split("–")
                print(df["Name"][profii],numrange[1])          # Papers (index could use this way, but years cannot.
                df.loc[profii,"Publications"]=numrange[1]

    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()

    return

def PublisherCluster(df,name,profii):         # split name to patent, journal and conference
    dict = {"patent":["patent","专利"],
            "conference":["symposium", "conference", "conf","proceedings", "abstract","review",r"\d+th",r"\d+3rd",r"\d+2nd",r"\d+1st",r"20\d\d","workshops","progress","za zhi", "international", "research section","annals","bulletin","zhonghua","volume"],     # XXXth, chinese zha zi assumed to be a conference
            "journal":["journal","transactions","press","letters","springer","express"] }        # crc press        # words less than 4 ??
    # if re.search("patent",name,re.IGNORECASE):
    foundflag=False
    for ii, ptype in enumerate(dict):
        # print("Matching ",ptype, ".......")
        for w in dict[ptype]:
            if re.search(r"\b"+w+r"\b", name,re.IGNORECASE):
                print(ptype," Matched: kw - ",w, "\n")
                if ptype == "patent":
                    df.loc[profii,"5Y-Patent"] += 1
                elif ptype == "conference":
                    df.loc[profii,"5Y-Conf"] += 1
                elif ptype == "journal":
                    df.loc[profii,"5Y-Journal"] += 1

                foundflag=True
                break
    if not foundflag:
        try:
            name=re.search(r"([A-Za-z]+\s)+",name).group(0)
            if len(name[:-1].split(" ")) < 5:
                print("journal, Matched: Words < 5 ", name)
                df.loc[profii,"5Y-Journal"] += 1
            else:
                print("COULD NOT SORT:", name, "=========================\n")
                return False
                # import pdb
                # pdb.set_trace()

        except:
            print("COULD NOT SORT:", name, "=========================\n")
            return False            # record False Item
    return True

def GoogleScholar5YPub():
    x1=pd.ExcelFile('ece-faculty.xlsx')
    df=x1.parse("Sheet1")

    filename="output/5YErrorItem.html"
    filenamesort="output/5YErrorSort.html"
    pub_file=open(filename,'w')        # create a new file in the directory
    pubsort_file=open(filenamesort,'w')        # create a new file in the directory

    pub_file.write("<meta charset=\"utf-8\">"+"\n")     # support chinese character
    pubsort_file.write("<meta charset=\"utf-8\">"+"\n")     # support chinese character

    firefox=webdriver.Firefox()

    startnum=0
    for profii in range(startnum,len(df)):
        url=df["gscholar"][profii]
        # url=df["gscholar"][0]
        if pd.isnull(url):
            continue
        if url[-5:]=="zh-TW":
            url = url[:-5] + "en"
            # import pdb
            # pdb.set_trace()

        df.loc[profii,"5Y-Journal"] = 0
        df.loc[profii,"5Y-Conf"] = 0
        df.loc[profii,"5Y-Patent"] = 0

        pub_file.write("<h3>"+df["Name"][profii]+"</h3>"+"\n")
        pubsort_file.write("<h3>"+df["Name"][profii]+"</h3>"+"\n")
        firefox.get(url)

        html=firefox.page_source
        soup = BeautifulSoup(html,"lxml")
        for yearlink in soup.select("a.gsc_a_a"):
            if yearlink.text == "Year" :
                print(yearlink['href'])
                url="https://scholar.google.com.hk" + yearlink['href']
                print(url)
                firefox.get(url)
            else:
                print(url)          # don't know whether the intial page is sorted by "Year" or not

        element=firefox.find_element_by_id("gsc_bpf_more")

        for ii in range(0,10):      # over click
            element.click()
            time.sleep(0.5)

            html=firefox.page_source
            soup = BeautifulSoup(html,"lxml")
            button = soup.find("button",attrs={'id':"gsc_bpf_more"})
            if not ( len(button["class"]) == 2 ): #'', gs_btn_smd, gs_dis;  #right:'',gs_btn_smd
                break

        for papertitle in soup.select("td.gsc_a_t"):
            # publisher=papertitle.find("div.gs_gray")[0:1]
            publisher=papertitle.select("div.gs_gray")[1:2][0]
            try:
                year=int(publisher.select_one("span.gs_oph").text[-4:])
            except:
                pub_file.write(str(papertitle)+"\n")
                continue
                #Error: no publisher
                # import pdb
                # pdb.set_trace()

            print(publisher)
            if year>2012:       # begin from 2013
                print(publisher.text[:-4])
                ret=PublisherCluster(df,publisher.text[:-4],profii)
                if not ret:
                    pubsort_file.write(str(papertitle)+"\n")
            else:
                break

    pub_file.close()
    pubsort_file.close()

    writer=pd.ExcelWriter('ece-faculty.xlsx')
    df.to_excel(writer,'Sheet1')
    writer.save()
    # for publisher in soup.select("div.gs_gray"):
        # print(publisher)
    return

if __name__=="__main__":
    # DBInit()
    # Student()
    # WebInfoRec()
    # Student("Phd")
    # Student("MPhil")

    # GoogleCitations()
    # GoogleScholarPapers()

    GoogleScholar5YPub()

    # print(namematch("A. Kodi",["Wang Zhe", "Jiang Xu", "Ian O'Connor","Avinash Karanth Kodi"]))
    # ECEWeb("/ece.php/profile/facultydetail/m.mckay")
