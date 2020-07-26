pasteText(text:="", win:="", cntrl:="", waitWin:="") {
    if text {
        clipOld:=ClipboardAll
        Clipboard:=text
        ClipWait, 0.1, 1
    }

    if waitWin
        WinWaitActive, % waitWin
    sleep 100

    if (win) {
        ControlSend, % cntrl, ^v, % win
    } else {
        Send, +{Insert} ;^v
    }
    
    if text
        Clipboard:=clipOld

    return

}