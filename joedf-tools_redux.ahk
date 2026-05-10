#Requires AutoHotkey v2.0
#SingleInstance Force

G_SUSPEND := false

#HotIf !G_SUSPEND

; KDE style easy window drag and resize
#Include src\EasyWindowDragging_KDE.ahk

/*
- Opacity
	- Win+ScrollUp = More
	- Win+ScrollDown = Less
	- Win+O = Reset
*/
#Include src\WindowOpacity.ahk

#HotIf

; Taskbar Volume scrolling
#Include src\TaskbarVolumeScroll.ahk

/*
- Misc simple keybinds
	- Ctrl+Space = toggle AlwaysOnTop for active window
	- Shift+Win+C = open a new CMD window with the desktop path
*/
#Include src\MiscKeybinds.ahk

; Get IP and location info
#Include src\GetInfoIP.ahk

; Automatically self-suspend hotkeys if a given process is running.
#Include src\AutoSuspendSelf.ahk

; Setup tray menu
#Include src\TrayMenuSetup.ahk
