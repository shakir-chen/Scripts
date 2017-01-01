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
