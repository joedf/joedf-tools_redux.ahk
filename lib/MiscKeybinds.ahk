; joedf: simple keybinds I had in my original v1.1 utility script

; toggle AlwaysOnTop for active window
^Space::WinSetAlwaysOnTop -1, "A"

; open a new CMD window with the desktop path
^#c::run "cmd /K cd %USERPROFILE%\Desktop"