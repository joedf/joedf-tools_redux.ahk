#Requires AutoHotkey v2.0
#SingleInstance Force

; KDE style easy window drag and resize
#Include lib\EasyWindowDragging_KDE.ahk

; Taskbar Volume scrolling
#Include lib\TaskbarVolumeScroll.ahk

/*
- Misc simple keybinds
	- Ctrl+Space = toggle AlwaysOnTop for active window
	- Shift+Win+C = open a new CMD window with the desktop path
*/
#Include lib\MiscKeybinds.ahk

/*
- Opacity
   - Win+ScrollUp = More
   - Win+ScrollDown = Less
   - Win+O = Reset
*/
#Include lib\WindowOpacity.ahk