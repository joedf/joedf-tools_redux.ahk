#Requires AutoHotkey v2.0

#Include lib\JSON.ahk

; Basic IP and location info grab
; by joedf - started October 21, 2024

; Example JSON output from dazzlepod.com/ip
/*
{
	"ip": "127.0.34.121",
	"prefix": "127.0.0.0/18",
	"country_code": "DE",
	"country": "Germany",
	"city": "Berlin",
	"latitude": 52.5200,
	"longitude": 13.4050,
	"asn": "AS3320",
	"number": 3320,
	"org": "Deutsche Telekom AG",
	"timezone": "Europe/Berlin",
	"time": "2024-10-21T15:20:46+02:00",
	"user_agent": "curl/8.9.1"
	}
*/

class IP_Check
{
	; now offline? https://dazzlepod.com/ip/me
	__New(dataSourceUrl:="http://ip-api.com/json/") {
		this.DATA_SOURCE_URL := dataSourceUrl
		this.request := ComObject("Msxml2.XMLHTTP")
		this.AttachTrayTipEvents()
	}

	AttachTrayTipEvents() {
		; Based on code from https://www.autohotkey.com/boards/viewtopic.php?p=95185#p95185
		OnMessage(0x404, ObjBindMethod(this, "__OnTrayTipEvent"))
	}

	__OnTrayTipEvent(wParam, lParam, msg, hwnd)
	{
		if (hwnd != A_ScriptHwnd)
			return
		if (lParam = 1029) ; NIN_BALLOONUSERCLICK
		{
			; MsgBox("Notification was left-clicked.")
			; Show ip full info page
			Run(this.DATA_SOURCE_URL)
		}

		if (lParam = 1028) ; NIN_BALLOONTIMEOUT
		{
			; MsgBox("Notification timed out or was closed or right-clicked.")
		}
	}

	__OnHideTrayTip() {
		TrayTip()
	}

	Execute(__readyFuncName:="Ready") {
		; Make an async request
		this.request.open("GET", this.DATA_SOURCE_URL, true)
		; set user agent
		this.request.setRequestHeader("User-Agent", "User-Agent: curl/8.9.1")
		; setup callback
		this.request.onreadystatechange := ObjBindMethod(this, __readyFuncName)
		; send it
		this.request.send()
	}

	ExecuteCopy() {
		this.Execute("ReadyCopy")
	}

	Ready() {
		if (this.request.readyState != 4)  ; Not done yet.
			return
		if (this.request.status == 200) { ; OK.
			sInfo := this.Parse_to_Display_String(this.request.responseText)
			this.Present(sInfo)
		} else {
			this.Present("IP check request failed (Status = " this.request.status ")")
		}
	}

	ReadyCopy() {
		if (this.request.readyState != 4)  ; Not done yet.
			return
		if (this.request.status == 200) { ; OK.
			sJson := this.request.responseText
			obj := JSON.parse(sJson)
			A_Clipboard := obj["ip"]
		}
	}

	Parse_to_Display_String(sJson) {
		obj := JSON.parse(sJson)
		localIPs := SysGetIPAddresses()

		if (!obj.Has("ip")) {
			if (obj.Has("query")) {
				obj["ip"] := obj["query"]
			}
		}

		out := "Public: " obj["ip"] "`nLocal: " localIPs[1] "`nLocation: " obj["city"] ", " obj["country"]
		return out
	}

	Present(text, timeMs:=5000, title:="IP Check Info") {
		TrayTip text, title
		SetTimer () => this.__OnHideTrayTip(), -1 * Abs(timeMs)
	}
}


; no need if not stand alone script
; Persistent
; IP_Check().Execute()


IP_Check_Setup_TrayMenu() {
	GetInfoIP := IP_Check()
	DoNotifyIP(ItemName, ItemPos, MyMenu) {
		return GetInfoIP.Execute()
	}
	DoCopyIP(ItemName, ItemPos, MyMenu) {
		return GetInfoIP.ExecuteCopy()
	}
	A_TrayMenu.Add("Show IP info", DoNotifyIP)
	A_TrayMenu.Add("Copy IP (Public)", DoCopyIP)
}