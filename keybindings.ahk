; Install autohotkey. 
; Then create shortcut to this file under: C:\Users\<YOURUSERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
; or doubleklick this file
;
; # Win (Windows logo key)
; ! Alt
; ^ Control
; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

#Warn  ; Enable warnings to assist with detecting common errors.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#installkeybdhook
#SingleInstance, force
SetCapsLockState, AlwaysOff
return

;Space & F1::Return ; Mentioned in the hotkeys docs for UP
;*Space::Send {Blind}{Space} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being  held

; With following lines the key # will also printed, when no further key is pressed
; Example:
; Mentioned in the hotkeys docs for UP:
;    In einem ähnlichen Zusammenhang besteht eine ähnliche Technik wie oben darin, einen Hotkey in einen Präfixschlüssel zu 
;    verwandeln. Der Vorteil ist, dass der Hotkey zwar beim Loslassen ausgelöst wird, dies jedoch nur, wenn Sie keine andere Taste 
;    gedrückt haben, während er gedrückt gehalten wurde. Zum Beispiel:
; LControl & F1::return  ; Make left-control a prefix by using it in front of "&" at least once.
; LControl::MsgBox You released LControl without having used it to modify any other key. 

;# & F1::Return ; Mentioned in the hotkeys docs for UP
;*#::Send {Blind}{ä} ;


; AHK implementing layer CapsLock Part1
; https://www.autohotkey.com/boards/viewtopic.php?f=7&t=20661&p=119764

$#::
    KeyWait, #
    return

CapsLock::
	KeyWait, CapsLock
;	If (A_PriorKey="CapsLock")
;		SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
	Return


; AHK implementing TouchCursor
;   http://martin-stone.github.io/touchcursor/
;   https://autohotkey.com/boards/viewtopic.php?t=6525
;   https://github.com/jeebak/keyboard-windows
; I don't use all available functions here

					      
; Task switching
Space & Tab::AltTab
Space & q::Send, {Alt Down}{Tab}{Alt Up}
Space & w::Send, {Ctrl Down}{Tab}{Ctrl Up}

; New, Refresh
Space & r::Send, {F5}

; TouchCursor (minus "insert" ["y" is used to Volume_Mute])

Space & j::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	    send, +^{left}
	} else if(GetKeyState("Shift", "P")){
		send, +{left}
	} else if(GetKeyState("Control", "P")){
		send, ^{left}
	} else {
	   send, {left}     
	}
	Return

Space & i::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	    send, +^{Up}
	} else if(GetKeyState("Shift", "P")){
		send, +{Up}
	} else if(GetKeyState("Control", "P")){
		send, ^{Up}
	} else {
	   send, {Up}     
	}
	Return

Space & k::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	send, +^{Down}
	} else if(GetKeyState("Shift", "P")){
		send, +{Down}
	} else if(GetKeyState("Control", "P")){
		send, ^{Down}
	} else {
	   send, {Down}     
	}
	Return

Space & l::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	send, +^{Right}
	} else if(GetKeyState("Shift", "P")){
		send, +{Right}
	} else if(GetKeyState("Control", "P")){
		send, ^{Right}
	} else {
	   send, {Right}     
	}
	Return


Space & h::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	send, +^{Home}
	} else if(GetKeyState("Shift", "P")){
		send, +{Home}
	} else if(GetKeyState("Control", "P")){
		send, ^{Home}
	} else {
	   send, {Home}     
	}
	Return


Space & o::
	if(GetKeyState("Shift", "P") and GetKeyState("Control", "P")){ 
	send, +^{End}
	} else if(GetKeyState("Shift", "P")){
		send, +{Del}
	} else if(GetKeyState("Control", "P")){
		send, ^{Del}
	} else {
	   send, {Del}     
	}
	Return

Space & ö::
	if(GetKeyState("Shift", "P")){
		send, +{End}
	} else {
	   send, {End}     
	}
	Return



Space & u::Send, {Backspace}
Space & n::Send, {PgUp}
Space & m::Send, {PgDn}


; Select all, Space, Find
Space & a::Send, {Ctrl Down}a{Ctrl Up}
Space & s::Send, {Space}
Space & f::Send, {Ctrl Down}f{Ctrl Up}


; Undo, Cut, Copy and Paste
Space & <::
Space & y::Send, {Ctrl Down}z{Ctrl Up}
Space & x::Send, {Ctrl Down}x{Ctrl Up}
Space & c::
  If WinActive("ahk_exe mintty.exe") {
    Send {Ctrl Down}{Insert}{Ctrl Up}
  } Else If WinActive("ahk_exe WindowsTerminal.exe") {
    Send {Ctrl Down}{Insert}{Ctrl Up}
  } Else {
    Send, {Ctrl Down}c{Ctrl Up}
  }
  Return

Space & z::  
Space & v::
  If WinActive("ahk_exe ConEmu64.exe") {
    Send {LShift Down}{Insert}{LShift Up}
  } Else If WinActive("ahk_exe mintty.exe") {
    Send {LShift Down}{Insert}{LShift Up}
  } Else If WinActive("ahk_exe WindowsTerminal.exe") {
    Send {LShift Down}{Insert}{LShift Up}
  } Else {
    Send, {Ctrl Down}v{Ctrl Up}
  }
  Return
 

Space::
	Send, {Space}
	Return



; AHK implementing layer CapsLock Part2

#If, GetKeyState("CapsLock", "P") or  GetKeyState("#", "P")  ;Your CapsLock Hotkeys go below

	7::
		Send, {/}
		return
	8::
		Send, {|}
		return
	9::
		Send, {\}
		return

	i::
		Send, {END}{{}{Enter} ;goto end and print semicolon and enter
		return

	u::
		Send, {END}{;}{Enter} ;goto end and print semicolon and enter
		return

	z::
		Send, {END}{Enter} ;goto end and enter
		return

	j::
		Send, {(} 
		return
	k::
		Send, {{} 
		return
	l::
		Send, {[}
		return
	m::
		Send, {)} 
		return
	,::
		Send, {}} 
		return
	.::
		Send, {]} 
		return


	h::
		Send, {<} 
		return
	p::
		Send, {=} 
		return
	n::
		Send, {>} 
		return


	ü::
		Send, {=}{>}  
		return
	+::
		Send, {-}{>} 
		return



	-::
	   Send, {#}
	   return
	ö::
	   Send, '
	   return	
	ä::
	   Send, "
	   return


	q::
	   Send, @
	   return
	   
	a::
	   Send, {!}
	   return   

#If
