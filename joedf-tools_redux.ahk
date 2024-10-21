#Requires AutoHotkey v2.0
#SingleInstance Force

; KDE style easy window drag and resize
#Include src\EasyWindowDragging_KDE.ahk

; Taskbar Volume scrolling
#Include src\TaskbarVolumeScroll.ahk

/*
- Misc simple keybinds
	- Ctrl+Space = toggle AlwaysOnTop for active window
	- Shift+Win+C = open a new CMD window with the desktop path
*/
#Include src\MiscKeybinds.ahk

/*
- Opacity
	- Win+ScrollUp = More
	- Win+ScrollDown = Less
	- Win+O = Reset
*/
#Include src\WindowOpacity.ahk

; Get IP and location info
#Include src\GetInfoIP.ahk
IP_Check_Setup_TrayMenu()
