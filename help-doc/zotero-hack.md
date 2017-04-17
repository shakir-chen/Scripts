#Zotero Hack Manual
firefox zotero locate @ ~/.mozilla/firefox/ltltr2ow.default/zotero

# Filesystem
locate              engine-json
storage             Store-PDF-Files
translators         Scrapy-From-Specify-Website
pipes               pipe
styles              Citation-Style-Languge-Files(csl)
zotero.sqlite       Sqlite-DataBase

Filefolder-Group
...Collection

# Database Structure
Tables(57)
Indices(74)
Views(0)
Triggers(166)


Tables
...creators         Record-Date-Add/Modify
...creatorTypesj
...creatorData      author-list
...collections      collectionID-Name-key(folders)
...fields           fieldID-fieldName(pages,ISBN,publicationTitle)

...itemAttatchment  itemAttatchment-location
...itemNotes        note
...itemID           tagID
...itemType         TypeFields
...itemDataValue    abstract

...tags             name

...translatorCache  Translator-Use
...fileTypes        image/web


## Source Code
Standalone
```
git clone --recursive git://github.com/zotero/zotero.git zotero
git checkout 4.0
```
Firefox
```
Install an unbranded build of firefox
```
<https://www.zotero.org/support/dev/source_code>

## Firefox Zotero Structure
Firefox Plugin Location: ~/.mozilla/plugin or /usr/lib/mozilla/plugins/
But it's only a library
git-repo/test/tests/
```
gp "\<ZoteroPane" .
```
Zotero
ZoteroPane
ZoteroItemPane
ZoteroItemOverlay
Zotero_Browser
Zotero_File_Exporter
Zotero_File_Interface
Zotero_Locatemenu
Zotero_Lookup
Zotero_RecognizePDF
Zotero_Report_Interface
Zotero_Timeline_Interface

## Software Structure


## Bibliography Output Format

<https://zotero-manual.github.io/zotero-manual/citations>
### 1. Search
<https://www.zotero.org/styles?q=ieee%20Tran>
### 2. Editing CSL Styles
<https://www.zotero.org/support/dev/citation_styles/style_editing_step-by-step>

### 3. Most Easy Way
Search IEEE (popular is best) and edit => use code editor


```
<bibliography entry-spacing="0" second-field-align="flush">
    <if type="article-journal">
        <group delimiter=", ">
          <text macro="title"/>                                                     //change here if you don't want it, delete
          <text variable="container-title" font-style="italic"/>
          <text macro="issued"/>
        </group>
      </if>
      <else-if type="paper-conference speech" match="any">
        <group delimiter=", ">
            ...
        </group>
      </else-if>
      <else-if type="report">
```

test online, add wrongly json like the bellow
[1]A. B. Ahmed, M. Meyer, Y. Okuyama, and A. B. Abdallah, “Hybrid Photonic NoC Based on Non-Blocking Photonic Switch and Light-Weight Electronic Router,” in 2015 IEEE International Conference on Systems, Man, and Cybernetics (SMC), 2015.

<http://editor.citationstyles.org/about/>

