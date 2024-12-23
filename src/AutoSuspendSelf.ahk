; Script to auto suspend when a given process is running.
; Started Dec 23, 2024
; by joedf

#Requires AutoHotkey v2.0

SuspendCheckInterval := 5000 ;ms
SuspendProcesses := [
	"Warhammer 40000 Space Marine 2 - Retail.exe",
	"helldivers2.exe",
	; "notepad.exe"
]

; MsgBox CheckAnyProcessesExist(SuspendProcesses)
SetTimer CheckForProcesses, SuspendCheckInterval


CheckForProcesses() {
	global SuspendProcesses
	doSuspend := !!(CheckAnyProcessesExist(SuspendProcesses))
	Suspend doSuspend
}

CheckAnyProcessesExist(processList) {
	for p in processList {
		if (PID := ProcessExist(p)) {
			return PID
		}
	}
	return false
}
