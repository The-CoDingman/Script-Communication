#Requires AutoHotkey v2
Persistent

OnMessage(0x004A, ReceiveMessage)
ReceiveMessage(wParam, lParam, Msg, Hwnd) {
    Msg := StrGet(NumGet(lParam, (2 * A_PtrSize), "Ptr"))
    if (Msg = "Pause") {
        Pause(-1)
    } else if (Msg = "Suspend") {
        Suspend(-1)
    } else if (Msg = "Reload") {
        Reload()
    } else if (Msg = "ExitApp") {
        ExitApp()
    } else {
        MsgBox("Incoming Message: " Msg)
    }
}