#Zotero Hack Manual

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
