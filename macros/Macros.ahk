﻿#MaxHotkeysPerInterval 200
Menu, Tray, Icon, Logo.ico

#Include Gdip.ahk
#Include Hotstrings.ahk
#Include WinActive.ahk
#Include WindowsTerminal.ahk
#Include Screenshot.ahk
#Include BlockKBnM.ahk
#Include VolumeControl.ahk

$^+!P:: RunPoEDependencies() ; Ctrl + Shift + Alt + P
$!O:: GetMousePosition() ; Alt + O

+#F12:: ; Shift + Win + F12
    Reload
    SoundBeep, 100, 500
Return

$#F12:: ; Win + F12
    Suspend
    SoundBeep, 750, 500
Return

RunPoEDependencies(){
    Run C:\Users\%A_UserName%\AppData\Local\Programs\Awakened PoE Trade\Awakened PoE Trade.exe
    Run C:\Users\%A_UserName%\AppData\Local\PoeLurker\PoeLurker.exe
    Run C:\Users\%A_UserName%\AppData\Roaming\Path of Building Community\Path of Building.exe
    Return
}

GetMousePosition(){
    MouseGetPos, xpos, ypos
    PixelGetColor, xycolor , xpos, ypos
    msgbox, X=%xpos% Y=%ypos% XYColor=%xycolor%
    Return
}

; ^ Ctrl
; ! Alt
; + Shift
; # Win
