; Basic v2 version of my volume scroll over taskbar script
; OSD is no longer needed, an OSD is built in Windows 10+
; https://www.autohotkey.com/board/topic/94165-simple-volume-osd/

#HotIf MouseIsOver("ahk_class Shell_TrayWnd") || MouseIsOver("ahk_class Shell_SecondaryTrayWnd")

WheelUp::Send "{Volume_Up}"
WheelDown::Send "{Volume_Down}"

; Modifier key for fast change
+WheelUp::Send "{Volume_Up 4}"
+WheelDown::Send "{Volume_Down 4}"

#HotIf

MouseIsOver(WinTitle) {
	MouseGetPos ,, &Win
	return WinExist(WinTitle " ahk_id " Win)
}