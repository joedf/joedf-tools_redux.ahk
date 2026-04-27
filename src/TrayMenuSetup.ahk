; Setup tray menu
lastHoverAction := A_Now - 10
TraySetIcon "logo.ico"
A_TrayMenu.Delete() ; clears the standard / default menu
; ---------------------------
GetInfoIP := IP_Check()
A_TrayMenu.Add("Show IP info", DoNotifyIP)
A_TrayMenu.Add("Copy IP (Public)", DoCopyIP)
; ---------------------------
A_TrayMenu.Add() ; Creates a separator line.
A_TrayMenu.Add("About (webpage)", ShowAbout)
A_TrayMenu.Add()
A_TrayMenu.AddStandard()
A_TrayMenu.Default := "Show IP info"

; Tray menu actions
ShowAbout(*) {
	Run "https://github.com/joedf/joedf-tools_redux.ahk"
}
DoNotifyIP(ItemName, ItemPos, MyMenu) {
	return GetInfoIP.Execute()
}
DoCopyIP(ItemName, ItemPos, MyMenu) {
	return GetInfoIP.ExecuteCopy()
}

OnMessage(0x404, AHK_NOTIFYICON)
AHK_NOTIFYICON(wParam, lParam, *) {
	global lastHoverAction
	switch lParam
	{
		case 0x200: ; WM_MOUSEMOVE
			if (A_Now - lastHoverAction > 5) {
				GetInfoIP.ExecuteTrayTip()
				lastHoverAction := A_Now
			}
		;case 0x201: ; WM_LBUTTONUP
		;case 0x203: ; WM_LBUTTONDBLCLK
	}
}