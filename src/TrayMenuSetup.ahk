; Setup tray menu
G_TrayIconClicks := 0
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

; TrayIcon - Differentiate between a single click and double click
; Based on solution by AHK user "Serenity"
; https://www.autohotkey.com/board/topic/33843-single-click-vs-double-click-on-tray-icon/#entry214214
OnMessage(0x404, AHK_NOTIFYICON) ; WM_USER + 4
AHK_NOTIFYICON(wParam, lParam, *) {
	global G_TrayIconClicks
	if (lParam == 0x201) ; WM_LBUTTONUP
	{
		G_TrayIconClicks := 1
		SetTimer TrayIconClickCheck, -250
		return 0
	}
	else if (lParam == 0x203) ; WM_LBUTTONDBLCLK
	{
		G_TrayIconClicks := 2
		return 0
	}
}
TrayIconClickCheck() {
	global G_TrayIconClicks
	switch G_TrayIconClicks
	{
		case 1: GetInfoIP.ExecuteToolTip()
		case 2: GetInfoIP.Execute()
	}
}