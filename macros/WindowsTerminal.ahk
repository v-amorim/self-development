; https://gist.github.com/andrewgodwin/89920ee02501ab12d09b02500897066c

$#T:: ToggleTerminal()
$#V:: RunVSCode()

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
RunVSCode(){
    Run C:\Users\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ToggleTerminal() {
    matcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    DetectHiddenWindows, On
    if WinExist(matcher) {

        if !WinActive(matcher) {
            ; Hide it first to alow raising it later on a different workspace
            HideTerminal()
            ShowTerminal()
        } else if WinExist(matcher) {
            HideTerminal()
            Send, {LButton}
        }

    } else {
        OpenNewTerminal()
    }
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
OpenNewTerminal() {
    Run wt.exe
    Sleep, 500
    ShowTerminal()
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ShowTerminal() {
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
HideTerminal() {
    WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}