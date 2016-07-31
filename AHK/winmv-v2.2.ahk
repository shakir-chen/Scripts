;;use tab + hjkl as windows move hotkeys
;;use tab + ,. as left screen divide hotkeys
s1flag=0    ; bit flag, vertical screen, for next screen use
s2flag=0    ; bit flag, horizontal screen

wii=0   ;%window part idex from 1 to 9      ; use 10 to 18 for lasttime rec

s1fr=  ; lastime screen 1 flag
s2fr=  ; lastime screen 1 flag
srec=  ; lasttime screen flag,screen record

scur=  ; current screen
flagcur= ;current flag

breakflag=0     ; denote function break signal

;---------------------------------------------------------------------- 
;   Gui Initial
;

Gui, +LastFound +AlwaysOnTop -Caption   
Gui, Color, black ,black
WinSet, Transparent, 180
Gui,Font,s80 cYellow bold,Calibri
;Gui, Add, Text,Center h300 w300 vMyTextField
Gui, Add, Text, h150 w300 vMyTextField

;---------------------------------------------------------------------- 
;   Vim-like Windows Move
;
Tab::
    Send {Tab}
    Return

Tab & k:: ;[tab]+[k]        ;up     9-8-6-5  if 6 not, then 7
    ;scur, flagcur
    wiiarr:=[9,8,6,7,5,2,4,1,3,1]
    findflag:=0
    WinGet, active_id, ID, A
    step:=0
    Loop, 9     ;the last one doesn't need the test
    {
        ind:=a_index+step
        wii:=wiiarr[ind]

        StringTrimRight, tempwinid, winrec%wii%, 0
        ;MsgBox wii is %wii%---up part id is %tempwinid%, active_id is %active_id%
        if(tempwinid="")
            continue
        IfWinNotExist, ahk_id %tempwinid%
        {
            wiir:=wii+9
            winrec%wii%:=winrec%wiir%       ;delete and replace win
            winrec%wiir%=                   ;delete and replace win
            continue
        }
        if (tempwinid=active_id)
        {
            findflag:=findflag | 0x01
            if (wii=6) || (wii=2) || (wii=4)
                step:=step+1
            if (wii=1) || (wii=3)
                break
        }
        else if (findflag & 0x01)
        {
            ;MsgBox final wii is %wii%---up part id is %tempwinid%
            findflag:=findflag | 0x80
            break
        }
    }   ;loop end
    if (findflag&0x80)
        Gosub, NewWinSwitch
    Return

Tab & j:: ;[Tab]+[j]            ;down
    wiiarr:=[1,3,2,4,2,5,6,7,8,9]
    findflag:=0
    WinGet, active_id, ID, A
    step:=0
    Loop, 9     ;the last one doesn't need the test
    {
        ind:=a_index+step
        wii:=wiiarr[ind]

        StringTrimRight, tempwinid, winrec%wii%, 0
        ;MsgBox wiiis %wii%---down part id is %tempwinid%, active_id is %active_id%
        if(tempwinid="")
            continue
        IfWinNotExist, ahk_id %tempwinid%
        {
            wiir:=wii+9
            winrec%wii%:=winrec%wiir%       ;delete and replace win
            winrec%wiir%=                   ;delete and replace win
            continue
        }
        if (tempwinid=active_id)
        {
            findflag:=findflag | 0x01
            if(wii=1)||(wii=3)||(wii=6)||(wii=4)
                step:=step+1
            if(wii=2)
                step:=step+2
            ;msgbox,step is %step%
        }
        else if (findflag&0x01)
        {
            findflag:=findflag |0x80
            break
        }
    }
    if (findflag&0x80)
        Gosub, NewWinSwitch
    Return

;left       9 loop
;findflag : bit0 -> find the active id or not;
;           bit1 -> find in screen 1 or not;
;           bit2 -> find active in 7 or not;    screen 1 special bit
;           bit3 -> find active in 3 or not;    screen 2 special bit
;           bit4 -> find active in 4 or not;
;           bit7 -> find switch windows or not

Tab & h:: ;[Tab]+[h]
    wiiarr:=[5,8,9,7,6,3,4,1,2,1]      ;5,8,9 ->3,4,2, 3 ->1,2; 4 ->2,1
    ;regard as a whold part, dealing the mouse move problem
    findflag:=0
    wiis1_p:=7      ;specific wii, screen 1 particular bit
    wiis2_p:=3      ;specific wii, screen 2 particular bit
    WinGet, active_id, ID, A
    step:=0
    Loop, 9     ;the last one doesn't need the test
    {
        ind:=a_index+step
        wii:=wiiarr[ind]

        StringTrimRight, tempwinid, winrec%wii%, 0
        ;MsgBox wii is %wii%---left part id is %tempwinid%, active_id is %active_id%
        if(tempwinid="")
            continue
        IfWinNotExist, ahk_id %tempwinid%
        {
            wiir:=wii+9
            winrec%wii%:=winrec%wiir%       ;delete and replace win
            winrec%wiir%=                   ;delete and replace win
            continue
        }
        if (tempwinid=active_id)
        {
            if wii=wiis1_p
                findflag:=findflag | 0x07
            else if wii=wiis2_p
                findflag:=findflag | 0x0b
            else if wii>4
                findflag:=findflag | 0x03
            else
                findflag:=findflag | 0x01

            if (findflag & 0x02)
                step:=5-a_index

            if (wii=3)
                step:=step+1

            if wii=4
            {
                findflag:=findflag | 0x10
                step:=step+1
            }
            ;msgbox, step is %step%,wii is %wii%
        }
        else if (findflag&0x01)
        {
            findflag:=findflag | 0x80
            break
        }

        if wii=wiiarr[9] && !(findflag&0x01)
            break
    }
    if (findflag&0x80)
        Gosub, NewWinSwitch
    Return


;right 9 loop
;findflag : bit0 -> find the active id or not;
;           bit1 -> find the active id or not;
;           bit7 -> find switch windows or not

Tab & l:: ;[Tab]+[l]            ;right
    wiiarr:=[1,2,3,4,3,6,7,5,8,9]
    ;1 ->3,4,... ;2->4,3... ;3 ->1,2; 4 ->2,1
    ;regard as a whold part, dealing the mouse move problem
    findflag:=0
    wiis1_p:=7      ;specific wii, screen 1 particular bit
    wiis2_p:=1      ;specific wii, screen 2 particular bit

    WinGet, active_id, ID, A
    step:=0

    Loop,9     ;the last one doesn't need the test
    {
        ind:=a_index+step
        wii:=wiiarr[ind]

        StringTrimRight, tempwinid, winrec%wii%, 0
        ;MsgBox wii is %wii%---right part id is %tempwinid%, active_id is %active_id%
        if(tempwinid="")
            continue
        IfWinNotExist, ahk_id %tempwinid%
        {
            wiir:=wii+9
            winrec%wii%:=winrec%wiir%       ;delete and replace win
            winrec%wiir%=                   ;delete and replace win
            continue
        }
        if (tempwinid=active_id)
        {
            findflag:=findflag | 0x01

            if(wii=1)||(wii=2)
                step:=step+1
            else if(wii<5)
                step:= 5-a_index

            if wii=6
                findflag:= findflag|0x02
            if wii>6 || win=5
                break
        }
        else if (findflag&0x01)
        {
            if (findflag&0x02)          ; part is 6
            {
                if (wii!=7)
                    break
            }
            findflag := findflag | 0x80
            break
        }
        if wii=wiiarr[10]
            break
    }
    if (findflag&0x80)
        Gosub, NewWinSwitch
    Return


;---------------------------------------------------------------------- 
;   Windows Module Seperation to different Parts
;

^,:: ; [CTL]+[,]    2 Parts Vertical Screen
 	WinGet, window, ID, A
    scur=1
    if (s1flag<2)       ;s5 low 1bit
    {
	    WinMove, ahk_id %window%, , 0, 40, 1080, 590
        flagcur=1           ;current flag
        GoSub, Recrefresh
        s1flag=30
    }
    else                ;s6,7,8,9
    {
    	WinMove, ahk_id %window%, , 0, 630, 1080, 1290
        flagcur=30
        GoSub, Recrefresh
        s1flag=1
    }
    ;MsgBox, Enter here, srec is %srec%,s1fr is %s1fr%
    ;refresh flags
    srec=%scur%
    s1fr=%flagcur%
    Return
^.:: ; [CTL]+[.]    2 parts Vertical Screen another Form
	WinGet, window, ID, A
    scur=1
    if (s1flag<8)   ; 5,6,7 screen, low -> mv win -> refresh next sflag
    {
    	WinMove, ahk_id %window%, , 0, 40, 1080, 960

        flagcur=7
        GoSub, Recrefresh

        s1flag=24
    }
    else            ; 8,9
    {
	    WinMove, ahk_id %window%, , 0, 1000, 1080, 920

        flagcur=24
        GoSub, Recrefresh

        s1flag=1
    }
    srec=%scur%
    s1fr=%flagcur%
    Return

^!,:: ;  [CTL]+[ALT]+[,]   4 parts 
    WinGet, window, ID, A
    scur=1
    if (s1flag<2)   ;part 5
    {
   	    WinMove, ahk_id %window%, , 0, 40, 1080, 590

        flagcur=1
        GoSub, Recrefresh

        s1flag=2
    }
    else if (s1flag<4)   ;parts 6
    {
   	    WinMove, ahk_id %window%, , -10, 630, 550, 370

        flagcur=2
        GoSub, Recrefresh

        s1flag=4
    }
    else if (s1flag<8) ;part 7
    {
   	    WinMove, ahk_id %window%, , 540, 630, 540, 370

        flagcur=4
        GoSub, Recrefresh

        s1flag=24
    }
    else                ;part 8 and 9, 8+16=24
    {
   	    WinMove, ahk_id %window%, , 0, 1000, 1080, 920

        flagcur=24
        GoSub, Recrefresh

        s1flag=1
    }
    srec=%scur%
    s1fr=%flagcur%
    Return

^!.:: ; [CTL]+[ALT]+[.]     4 parts
    WinGet, window, ID, A
    scur=1
    if (s1flag<2)       ;part 5
    {
   	    WinMove, ahk_id %window%, , 0, 40, 1080, 590

        flagcur=1
        GoSub, Recrefresh

        s1flag=6
    }
    else if (s1flag<8)   ;part 6 7
    {
   	    WinMove, ahk_id %window%, , 0, 630, 1080, 370
        flagcur=6
        GoSub, Recrefresh
        s1flag=8
    }
    else if (s1flag<16)
    {
   	    WinMove, ahk_id %window%, , 0, 1000, 1080, 460
        flagcur=8
        GoSub, Recrefresh
        s1flag=16
    }
    else
    {
   	    WinMove, ahk_id %window%, , 0, 1460, 1080, 460
        flagcur=16
        GoSub, Recrefresh
        s1flag=1
    }
    srec=%scur%
    s1fr=%flagcur%
    Return

~Tab & ,:: ; [tab]+[,] 2 Parts
	WinGet, window, ID, A
    scur=2
    if (s2flag<4)   ;part 1 and 2
    {
    	WinMove, ahk_id %window%, , -1920, 470, 960, 1080
        flagcur=3       ;0011
        GoSub, Recrefresh
        s2flag=12
    }
    else if(s2flag<13)   ;part 3,4
    {
	    WinMove, ahk_id %window%, , -960, 470, 960, 1080
        flagcur=12  ;1100
        GoSub, Recrefresh
        s2flag=15
    }
    else                ;part 4
    {
	    WinMove, ahk_id %window%, , -1920, 470, 1920, 1080      ;x,y, width,height
        flagcur=15
        GoSub, Recrefresh
        s2flag=3
    }
    srec=%scur%
    s2fr=%flagcur%
    Return

~Tab & .:: ; [Tab]+[.] 4parts
	WinGet, window, ID, A
    scur=2
    if (s2flag<2)
    {
    	WinMove, ahk_id %window%, , -1920, 470, 960, 540
        flagcur=1
        GoSub, Recrefresh
        s2flag=2
    }
    else if(s2flag<4)
    {
    	WinMove, ahk_id %window%, , -1920, 1010, 960, 540
        flagcur=2
        GoSub, Recrefresh
        s2flag=4
    }
    else if(s2flag<8)
    {
    	WinMove, ahk_id %window%, , -960, 470, 960, 540
        flagcur=4
        GoSub, Recrefresh
        s2flag=8
    }
    else
    {
    	WinMove, ahk_id %window%, , -960, 1010, 960, 540
        flagcur=8
        GoSub, Recrefresh
        s2flag=1
    }
    srec=%scur%
    s2fr=%flagcur%
    Return


^g:: Run, C:\Program Files\Git\git-bash.exe ;[CTL]+[G]

^i::
    if ( mode=0 )
        TrayTip, , Normal, 10, 1
    else
        TrayTip, , Insert, 10, 1
    sleep, 100
    Return

;---------------------------------------------------------------------- 
;   New Windows Swtich
;
NewWinSwitch:
    WinActivate, ahk_id %tempwinid%

    WinGetPos, X, Y, Width, Height, ahk_id %tempwinid%
    ;MsgBox, Calculator is at %X%, %Y%, %Width%,%Height%
    GUIX:=X+Width/2-150
    GUIY:=Y+Height/2-150

    GuiControl, ,MyTextField, ^_^
    Gui, Show, x%GUIX% y%GUIY% h300 w300, Window Switcher 
    SetTimer, CloseGUI, 300
return

;---------------------------------------------------------------------- 
;   Close GUI
;
CloseGUI:
    GUI Cancel
return

;---------------------------------------------------------------------- 
;   Refresh PartWindows Record
;
Recrefresh:
    ii=0x01

    if (scur=1)
    {
        looplen=5       ;loop length
        indexshift=4    ;index shift
    }
    else
    {
        looplen=4
        indexshift=0    ;index shift
    }

    Loop,%looplen%
    {
        ;MsgBox, debug-enter-in
        if (flagcur & ii)
        {
            ;MsgBox, %ii%
            ;backup part's win info
            wii:= a_index + indexshift
            wiir := wii + 9         ;wiir record windows index

            StringTrimRight, tempwinid, winrec%wii%, 0
            if (window != tempwinid)
            {
                winrec%wiir% := winrec%wii%
                winrec%wii%=%window%
            }
            else
            {
               if(srec=1)
                    s1fr:=s1fr & (~ii)
                else
                    s2fr:=s2fr & (~ii)
            }
            ;StringTrimRight, tempwinid, winrec%wii%, 0
            ;StringTrimRight, tempwinidr, winrec%wiir%, 0     ;tempwin id for record
            ;MsgBox, Screen %wii% id is %tempwinid%, Screen %wiir% id is %tempwinidr%
        }
        ii:=ii<<1
    }
    ;last positon renew
    ii=0x01
    if (srec=1)     ;record screen
    {
        looplen:=5       ;loop length
        indexshift:=4    ;index shift
        flagrec:=s1fr
        ;MsgBox, flagrec is %flagrec%
    }
    else
    {
        looplen:=4
        indexshift:=0    ;index shift
        flagrec:=s2fr
    }
    Loop,%looplen%
    {
        ;MsgBox, Refresh looplen:%looplen%, indexshift:%indexshift%
        if (flagrec & ii)
        {
            wii := a_index + indexshift
            wiir := wii + 9         ;wiir record windows index
            StringTrimRight, tempwinid, winrec%wii%, 0
            if (window=tempwinid)
            {
                winrec%wii% := winrec%wiir%
                winrec%wiir%=
                ;StringTrimRight, tempwinid, winrec%wii%, 0
                ;StringTrimRight, tempwinidr, winrec%wiir%, 0     ;tempwin id for record
                ;MsgBox,Refresh: Screen %wii% id is %tempwinid%, Screen %wiir% id is %tempwinidr%
                ;MsgBox last position renewed
            }
            ;StringTrimRight, tempwinidr, winrec%wiir%, 0     ;tempwin id for record
            ;MsgBox Screen %wii% id is %tempwinid%, Screen %wiir% id is %tempwinidr%
        }
        ii:=ii<<1
    }
    Return
