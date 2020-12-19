; Install autohotkey. 
; Then create shortcut to this file under: C:\Users\<YOURUSERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
; or doubleklick this file
;
; # Win (Windows logo key)
; ! Alt
; ^ Control
; + Shift
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.
; Version: 1.0

#Warn  ; Enable warnings to assist with detecting common errors.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#installkeybdhook
#SingleInstance, force
SetCapsLockState, AlwaysOff
return


;toggle pause key to suspends and restart script
Pause::
    Suspend
    Pause,,1
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
;*#::Send {Blind}{#} ;


ä & F1::Return ; Mentioned in the hotkeys docs for UP
*ä::Send {Blind}{ä} ;

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

~#Space::return
					      
; Task switching
;Space & Tab::AltTab
;Space & q::Send, {Alt Down}{Tab}{Alt Up}
;Space & w::Send, {Ctrl Down}{Tab}{Ctrl Up}

; New, Refresh
;Space & r::Send, {F5}

; TouchCursor (minus "insert" ["y" is used to Volume_Mute])

Space & s::
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

Space & e::
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

Space & d::
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

Space & f::
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


Space & a::
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


Space & r::
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

Space & g::
	if(GetKeyState("Shift", "P")){
		send, +{End}
	} else {
	   send, {End}     
	}
	Return



Space & w::Send, {Backspace}
Space & q::Send, {PgUp}
Space & t::Send, {PgDn}


; Select all, Space, Find
;Space & a::Send, {Ctrl Down}a{Ctrl Up}
;Space & s::Send, {Space}
;Space & f::Send, {Ctrl Down}f{Ctrl Up}


; Undo, Cut, Copy and Paste
Space & b::Send, {Ctrl Down}z{Ctrl Up}
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
 
 
Space & y:: Send, {Esc} 



Space & z::Send, {Enter}
Space & h::Send, 0
Space & m::Send, 1
Space & ,::Send, 2
Space & .::Send, 3
Space & j::Send, 4
Space & k::Send, 5
Space & l::Send, 6
Space & u::Send, 7
Space & i::Send, 8
Space & o::Send, 9

Space & p::Send, {+}
Space & -::Send, {-} 
Space & ö::Send, {*}
Space & 7::Send, {/}
Space & ü::Send, {/}
Space & +::Send, {^}


Space & 8::Send, {Tab}
Space & n::Send, {.}
Space & ä::Send, {"}

Space::
	Send, {Space}
	Return

; AHK implementing layer CapsLock Part2

#If, GetKeyState("CapsLock", "P") or  GetKeyState("#", "P") or  GetKeyState("ä", "P")  ;Your CapsLock Hotkeys go below

	7::Send, {/}
	8::Send, {|}
	9::Send, {\}

	i::
		Send, {END}{{}{Enter} ;goto end and print semicolon and enter
		return

	u::
		Send, {END}{;}{Enter} ;goto end and print semicolon and enter
		return

	z::
		Send, {END}{Enter} ;goto end and enter
		return

	j::Send, {(} 
	k::Send, {{} 
	l::Send, {[}
	m::Send, {)} 
	,::Send, {}} 
	.::Send, {]}
	h::Send, {<} 
	p::Send, {=} 
	n::Send, {>} 
	ü::Send, {=}{>}  
	-::Send, {#}
	+::Send, {-}{>} 
	ö::Send, {'}
	ä::Send, {"}
	q::Send, @
	a::Send, {!}

#If
