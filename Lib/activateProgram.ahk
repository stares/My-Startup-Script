activateProgram(spec){
	if !spec.process {
		msgbox % "Invalid spec: " spec.name
	}

	win:= spec.win " ahk_exe " spec.process

	if (spec.alwaysRun || !processExist(spec.process)) {
		Toast.show("Starting " spec.name " . . .")
		ShellRun(spec.run? spec.run: spec.process, spec.args)
		DetectHiddenWindows, On
		Winwait, % win ,, 5
	}

	if !winExist(win)
		send % spec.trigger

	DetectHiddenWindows, On
	Winwait, % win ,, 2s
	if ErrorLevel
		return
	sleep, 100

	WinActivate, % win
	if (spec.send)
		send, % spec.send
}
