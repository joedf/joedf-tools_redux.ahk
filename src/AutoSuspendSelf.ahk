; Script to auto suspend when a given process is running.
; Started Dec 23, 2024
; by joedf

#Requires AutoHotkey v2.0

SuspendCheckInterval := 5000 ;ms
SuspendProcesses := [
	"Warhammer 40000 Space Marine 2 - Retail.exe",
	"helldivers2.exe",
	"Marvel-Win64-Shipping.exe",
	"Tabletop Simulator.exe",
	"Sniper5_vulkan.exe",
	; "notepad.exe"
]

; MsgBox CheckAnyProcessesExist(SuspendProcesses)
SetTimer CheckForProcesses, SuspendCheckInterval


CheckForProcesses() {
	global SuspendProcesses
	doSuspend := false
	doSuspend := !!(CheckIfSteamGameRunning()) || doSuspend
	; doSuspend := !!(CheckAnyProcessesExist(SuspendProcesses)) || doSuspend
	Suspend doSuspend
}

CheckIfSteamGameRunning() {
	try {
		appId := RegRead("HKCU\Software\Valve\Steam", "RunningAppID") + 0
		return appId
	}
	return 0
}

CheckAnyProcessesExist(processList) {
	for p in processList {
		if (PID := ProcessExist(p)) {
			return PID
		}
	}
	return false
}
