#SingleInstance Force

;; Assign initial variables
delay = 99
xpos =
ypos = 
Hotkey, LButton, Off
Return


;; Hotkey actions
GetClickPosition:
	WinActivate, ahk_exe Discord.exe
	Hotkey, LButton, On
	Loop
		{
			ToolTip, Click chat input area of Discord to begin.
			if xpos
			break
		}
	ToolTip, 
	Hotkey, LButton, Off
Return

DeleteMessages:
Loop,
{
	IfWinActive, ahk_exe Discord.exe
	{
		Click, %xpos%, %ypos%
		Sleep, %delay%
		Send {UP}
		Sleep, %delay%
		Send ^a
		Sleep, %delay%
		Send {DEL}
		Sleep, %delay%
		Send {ENTER}
		Sleep, %delay%
		Send {ENTER}
		Sleep, 999
	}
}
Return

;; Hotkey triggers
LButton:: MouseGetPos, xpos, ypos

1::
GoSub, GetClickPosition
GoSub, DeleteMessages
Return

2::
Reload
Return

Esc::
ExitApp