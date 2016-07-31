GroupAdd, Pdfwindow, ahk_class AcrobatSDIWindow
GroupAdd, Pdfwindow, ahk_class QWidget
GroupAdd, Pdfwindow, ahk_class classFoxitReader
;GroupAdd, Pdfwindow, ahk_class SunAwtFrame   ;FREEMIND
;GroupAdd, Pdfwindow, ahk_class PPTFrameClass ; PPTX
GroupAdd, Pdfwindow, ahk_class screenClass  ; PPTX
GroupAdd, Pdfwindow, ahk_class CabinetWClass ; Windows' window
cnt2part=0
cnt3part=0
cnt4part=0
mode=0    ; 1-insert mode; 0-normal mode
cnt2s3p=0   ;2nd screen 3 part
cnt2s4p=0   ;2nd screen 3 part

;#h:: ; [Win]+[h] win+<-
;    Send {LWin Down}{Left}{LWin Up}
;#j:: ; [Win]+[j] win+<-
;    Send {LWin Down}{Down}{LWin Up}
;#k:: ; [Win]+[k] win+<-
;    Send {LWin Down}{Up}{LWin Up}
;#l:: ; [Win]+[l] win+<-
;    Send {LWin Down}{Right}{LWin Up}


^,:: ; [CTL]+[,]
    cnt2part++
    if (cnt2part=1)
    {
	    WinGet, window, ID, A
	;  InputBox, width, Resize, Width:, , 140, 130
	;    InputBox, height, Resize, Height:, , 140, 130
    	WinMove, ahk_id %window%, , 0, 630, 1080, 1290
    }
    else if(cnt2part=2)
    {
 	    WinGet, window, ID, A
	    WinMove, ahk_id %window%, , 0, 40, 1080, 590
	    cnt2part=0
    }
    else
    {
	    cnt2part=0
    }
    Return
^.:: ; [CTL]+[.]
    cnt2part++
    if (cnt2part=1)
    {
	    WinGet, window, ID, A
	;  InputBox, width, Resize, Width:, , 140, 130
	;    InputBox, height, Resize, Height:, , 140, 130
    	WinMove, ahk_id %window%, , 0, 40, 1080, 960
    }
    else if(cnt2part=2)
    {
 	    WinGet, window, ID, A
	    WinMove, ahk_id %window%, , 0, 1000, 1080, 920
	    cnt2part=0
    }
    else
    {
	    cnt2part=0
    }
    Return
^!,:: ;  [CTL]+[ALT]+[,]
    cnt3part++
    if (cnt3part=1)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 40, 1080, 590
    }
    else if (cnt3part=2)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , -10, 630, 550, 370
    }
    else if (cnt3part=3)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 540, 630, 540, 370
    }
    else if (cnt3part=4)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 1000, 1080, 920
        cnt3part=0
    }
    else
    {
	    cnt3part=0
    }
    Return

^!.:: ; [CTL]+[ALT]+[.]
    cnt4part++
    if (cnt4part=1)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 40, 1080, 590
    }
    else if (cnt4part=2)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 630, 1080, 370
    }
    else if (cnt4part=3)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 1000, 1080, 460
    }
    else if (cnt4part=4)
    {
    	WinGet, window, ID, A
   	    WinMove, ahk_id %window%, , 0, 1460, 1080, 460
        cnt4part=0
    }
    else
    {
	    cnt4part=0
    }
    Return
#,:: ; [Win]+[,] 3 Parts
    cnt2s3p++
    if (cnt2s3p=1)
    {
	    WinGet, window, ID, A
	;  InputBox, width, Resize, Width:, , 140, 130
	;    InputBox, height, Resize, Height:, , 140, 130
    	WinMove, ahk_id %window%, , -1920, 470, 960, 1080
    }
    else if(cnt2s3p=2)
    {
 	    WinGet, window, ID, A
	    WinMove, ahk_id %window%, , -960, 470, 960, 540
    }
    else if(cnt2s3p=3)
    {
 	    WinGet, window, ID, A
	    WinMove, ahk_id %window%, , -960, 1010, 960, 540 ;x,y, width,height
        cnt2s3p=0
    }
    else
    {
	    cnt2s3p=0
    }
    Return
#.:: ; [Win]+[.] 4parts
    cnt2s4p++
    if (cnt2s4p=1)
    {
	    WinGet, window, ID, A
	;  InputBox, width, Resize, Width:, , 140, 130
	;    InputBox, height, Resize, Height:, , 140, 130
    	WinMove, ahk_id %window%, , -1920, 470, 960, 540
    }
    else if(cnt2s4p=2)
    {
 	    WinGet, window, ID, A
    	WinMove, ahk_id %window%, , -1920, 1010, 960, 540
    }
    else if(cnt2s4p=3)
    {
 	    WinGet, window, ID, A
    	WinMove, ahk_id %window%, , -960, 470, 960, 540
    }
    else if(cnt2s4p=4)
    {
 	    WinGet, window, ID, A
    	WinMove, ahk_id %window%, , -960, 1010, 960, 540
	    cnt2s4p=0
    }
    else
    {
	    cnt2s4p=0
    }
    Return


^g:: Run, C:\Program Files\Git\git-bash.exe ;[CTL]+[G]

^i::
    if ( mode=0 )
        TrayTip, , Normal, 10, 1
    else
        TrayTip, , Insert, 10, 1
    sleep, 100
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

;#IfWinActive, ahk_class SunAwtFrame   ;FREEMIND
;o::
;    if ( mode=0 )
;       Send {Ctrl Down}{Enter}{Ctrl Up}
;    else
;        Send {o}
;    Return
;\::
;    if ( mode=0 )
;    {
;        Send {Ins}
;        mode=1
;    }
;    else
;        Send {\}
;    Return
;x::
;    if ( mode=0 )
;        Send {Del}
;    else
;        Send {x}

#IfWinActive, ahk_group Pdfwindow
;#If WinActive(Pdfwindow)
Esc::
    if ( mode=0 )
    {
        mode=1
        TrayTip, , Insert, 10, 1
    }
    else
    {
        mode=0
        TrayTip, , Normal, 10, 1
    }
    Return
^Esc::
    Send {Esc}
    TrayTip, , Normal, 10, 1
    sleep, 100
    mode=0
    Return
$Enter::
    Send {Enter}
    if ( mode=1 )
    {
        mode=0
        TrayTip, , Normal, 10, 1
        sleep, 100
    }
    Return
$i::
    if ( mode=0 )
    {
        mode=1
        Send {F2}
        TrayTip, , Insert, 10, 1
    }
    else
        Send {i}
    sleep, 100
    Return
$h::
    if ( mode=0 )
        Send {Left}
    else
        Send {h}
    Return
$j::
    if ( mode=0 )
        Send {Down}
    else
        Send {j}
    Return
$k::
    if ( mode=0 )
        Send {Up}
    else
        Send {k}
    Return
$l::
    if ( mode=0 )
        Send {Right}
    else
        Send {l}
    Return
$s::
    if ( mode=0 )
        Send {Ctrl Down}{s}{Ctrl Up}
    else
        Send {s}
    Return
$z::
    if ( mode=0 )
        Send {Ctrl Down}{w}{Ctrl Up}
    else
        Send {z}
    Return
+l::  ;;shift +l
    if ( mode=0 )
        Send {Ctrl Down}{Tab}{Ctrl Up}
    else
        Send {+}{l}
    Return
^l::  ;;control + l  for window not withdraw
    if ( mode=0 )
        Send {Alt Down}{Right}{Alt Up}
    else
        Send {Ctrl}{l}
    Return
^h::  ;;control + l for window withdraw
    if ( mode=0 )
        Send {Alt Down}{Left}{Alt Up}
    else
        Send {Ctrl Down}{h}{Ctrl Up}
Return

;#IfWinActive ahk_class QWidget
;h::Send {Left}
;j::Send {Down}
;k::Send {Up}
;l::Send {Right}
;Return

;#IfWinActive ahk_class Chrome_WidgetWin_1

