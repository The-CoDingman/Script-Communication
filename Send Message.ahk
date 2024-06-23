#Requires AutoHotkey v2

F1:: {
    WinTitle := "Receive Message.ahk ahk_class AutoHotkey" ;Put your `WinTitle` here
    SendMessageToScript("Hello!", WinTitle)
}

SendMessageToScript(Message, WinTitle, TimeOut := 5000) {
    NumPut("Ptr", SizeInBytes := (StrLen(Message) + 1) * 2, "Ptr", StrPtr(Message), CopyDataStruct := Buffer(3 * A_PtrSize), A_PtrSize)
    Prev_DetectHiddenWindow := A_DetectHiddenWindows, Prev_TitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows(True)
    SetTitleMatchMode(2)
    SendMessage(0x004A, 0, CopyDataStruct,, WinTitle,,,, TimeOut)
    DetectHiddenWindows(Prev_DetectHiddenWindow)
    SetTitleMatchMode(Prev_TitleMatchMode)    
}