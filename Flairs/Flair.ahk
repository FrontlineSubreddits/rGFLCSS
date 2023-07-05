;Lines starting with a ; are comments and are not part of the actual script.
;If you want to deactivate a flask press(e.g. because it is your hp flask) simply add a ; to the start of the line

;this line makes the script only work when PaintDotNet is the active window
;#IfWinActive, ahk_class PaintDotNet.exe

;The key (or mouse button) you press to activate the script. For a list of supported "keys" and combinations, see https://autohotkey.com/docs/Hotkeys.htm
;XButton1 = "Back"-Button on my mouse. For a complete list of special keys, see https://autohotkey.com/docs/KeyList.htm
F1::
{
	send, ^X

	send, ^r

	send, 40
	send, {Tab}
	send, 40	
	send, {Enter}

	send, ^+s
	;send, {Enter}

}
return