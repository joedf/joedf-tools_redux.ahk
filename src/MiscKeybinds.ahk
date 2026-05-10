; joedf: simple keybinds I had in my original v1.1 utility script

#HotIf !G_SUSPEND

; toggle AlwaysOnTop for active window
^Space::WinSetAlwaysOnTop -1, "A"

; open a new CMD window with the desktop path
^#c::run "cmd /K cd %USERPROFILE%\Desktop"

#HotIf

; hotkeys to skip/prev song playing
; my laptop doesn't have FN keys for prev/next, only pause, volume +/-, brightness
; Use [Shift] + [play/pause] to skip
+Media_Play_Pause::SendInput "{Media_Next}"
; [Shift] + [Volume Up] to go to previous
+Volume_Up::SendInput "{Media_Prev}"

; Send salute in helldivers2 chat
#HotIf WinActive("ahk_exe helldivers2.exe")
F9::SendInput("<s=80>o7")
#HotIf
