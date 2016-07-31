;=================================================
;Version: vim-soft-V2.3
;Modify: sheild tab key to Adobe or Foxit pdf Influence
;Date:2016-7-24
;=================================================

GroupAdd, Allwindow, ahk_class AcrobatSDIWindow
GroupAdd, Allwindow, ahk_class QWidget
GroupAdd, Allwindow, ahk_class classFoxitReader
GroupAdd, Allwindow, ahk_class SunAwtFrame   ;FREEMIND
GroupAdd, Allwindow, ahk_class PPTFrameClass ; PPTX
GroupAdd, Allwindow, ahk_class screenClass  ; PPTX
GroupAdd, Allwindow, ahk_class CabinetWClass ; Windows' window
GroupAdd, Freemind, ahk_class SunAwtFrame   ;FREEMIND
GroupAdd, Freemind, ahk_class SunAwtDialog ;FREEMIND Input window

;this section modified by ezuk, 03 July 2008
Gui, +LastFound +AlwaysOnTop -Caption
Gui, Color, black ,black
WinSet, Transparent, 180
Gui,Font,s40 cYellow bold,Calibri
Gui, Add, Text, h50 w200 vMySoftTextField

softmode=0      ; initial softmode is normal    i-> insert, kj ->normal


#include ./winmv-v2.2.ahk


#IfWinActive, ahk_class Photo_Lightweight_Viewer   ;Photo Viewer Figure
Tab::
    Return

#IfWinActive, ahk_class TkTopLevel  ;Python Figure
z::
    Send {Ctrl Down}{w}{Ctrl Up}
    Return
Return

#IfWinActive, ahk_class Photo_Lightweight_Viewer   ;Photo Viewer Figure
z::
    Send {Alt Down}{F4}{Alt Up}
    Return
Return

;#If WInActive("ahk_class SunAwtFrame") && (softmode == 0)

#If WInActive("ahk_group Freemind") && (softmode == 0)     ;Normal softmode
s:: Send {Ctrl Down}{s}{Ctrl Up}
x:: Send {Del}
?:: Send {Ctrl Down}{f}{Ctrl Up}        ;find
n:: Send {Ctrl Down}{g}{Ctrl Up}        ;next
y:: Send {Ctrl Down}{c}{Ctrl Up}
p:: Send {Ctrl Down}{v}{Ctrl Up}        ;paste
d:: Send {Ctrl Down}{x}{Ctrl Up}
b:: Send {Ctrl Down}{b}{Ctrl Up}        ;bold
u:: Send {Ctrl Down}{z}{Ctrl Up}        ;undo
z:: Send {Ctrl Down}{w}{Ctrl Up}        ;Enter Window
\::
    Send {Ins}
    softmode=1
    GuiControl, ,MySoftTextField, Insert
    Gosub, InfoShow
    Return
o::
    Send {Enter}
    softmode=1
    GuiControl, ,MySoftTextField, Insert
    Gosub, InfoShow
    Return
$Enter::
    Send {Ctrl Down}{Enter}{Ctrl Up}
    Return
q::
w::
e::
r::
t::
a::
g::
c::
v::
m::
return

;#If WInActive("ahk_group Freemind") && (softmode == 1)     ;Edit/ Insert softmode
#If WInActive("ahk_group Allwindow") && (softmode == 1)     ;Edit/ Insert softmode
~Esc::
    softmode=0
    GuiControl, ,MySoftTextField, Normal
    Gosub, InfoShow
    Return

$k::
    start:=A_TickCount
    wait:=1
    KeyWait, j, D T 0.1            ; wait for 1 second
    wait:=0
    ;KeyWait, % SubStr(A_ThisHotKey,2)
    Duration:=A_TickCount-start
    if Duration<100
    {
        softmode:=0
        GuiControl, ,MySoftTextField, Normal
        Gosub, InfoShow
    }
    else
    {
        if GetKeyState("CapsLock", "T") = 1
            Send {K}
        else
            Send {k}
    }
    ;Msgbox, Duration is %Duration%
Return

$j::
   if(wait=0)
   {
        if GetKeyState("CapsLock", "T") = 1
            Send {J}
        else
            Send {j}
   }
Return

$Enter::
    Send {Enter}
    softmode=0
    GuiControl, ,MySoftTextField, Normal
    Gosub, InfoShow
Return

#If WInActive("ahk_group Allwindow") && (softmode == 0)
Tab::
    Return
i::
    Send {F2}
    softmode=1
    GuiControl, ,MySoftTextField, Insert
    Gosub, InfoShow
    Return

h::
    Send {Left}
    Return
j::
    Send {Down}
    Return
k::
    Send {Up}
    Return
l::
    Send {Right}
    Return
Return

;----------------------------------------------------
;   Software Close GUI
;
SoftCloseGUI:
    GUI Cancel
return

InfoShow:
    WinGetPos, X, Y, Width, Height, A
    GUIX:=X+Width/2-200
    GUIY:=Y+Height/2-50
    Gui, Show, x%GUIX% y%GUIY% h100 w400, Window Switcher
    SetTimer, SoftCloseGUI, 500
return

