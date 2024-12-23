#Requires AutoHotkey v2.0
#SingleInstance Force

TraySetIcon "logo.ico"

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

; Automatically self-suspend hotkeys if a given process is running.
#Include src\AutoSuspendSelf.ahk

; Setup tray menu
A_TrayMenu.Delete() ; clears the standard / default menu
IP_Check_Setup_TrayMenu()
A_TrayMenu.Add() ; Creates a separator line.
A_TrayMenu.Add("About (webpage)", ShowAbout)
ShowAbout(*) {
	Run "https://github.com/joedf/joedf-tools_redux.ahk"
}
A_TrayMenu.Add()
A_TrayMenu.AddStandard()
