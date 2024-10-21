; Easy window opacity for v2 by joedf
; based / taken and modified from:
; https://www.howtogeek.com/44915/how-to-change-window-transparency-in-windows-7/
; https://poojanblog.com/blog/2008/08/autohotkey-transparency-script/

DetectHiddenWindows true

; Avoid / reduce the interval warning
A_MaxHotkeysPerInterval := 128

; maybe do the window under mouse instead of active window?
; MouseGetPos ,, &MouseWin
; WinGetTransparent(MouseWin)

#WheelUp::
{
	curtrans := WinGetTransparent("A")
	if (!curtrans) {
		curtrans := 255
	}
	newtrans := Min(Max(curtrans, 0) + 8, 255)
	if (newtrans == 255) {
		WinSetTransparent "OFF", "A"
	}
	WinSetTransparent newtrans, "A"
}

#WheelDown::
{
	curtrans := WinGetTransparent("A")
	if (!curtrans) {
		curtrans := 255
	}
	newtrans := Min(Max(curtrans - 8, 0), 255)
	if (newtrans > 0) {
		WinSetTransparent newtrans, "A"
	}
}

#o::
{
	WinSetTransparent 255, "A"
	WinSetTransparent "OFF", "A"
}