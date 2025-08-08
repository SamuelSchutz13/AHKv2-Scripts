;===========<Global>=================================
; Scripts requires Auto Hotkey 2.0
#Requires AutoHotkey v2.0
; ===========<Libs>===================================
#Include libs/Audio.ahk
; ----------------------------------------------------

; ===========<Explorer>===============================
; Wheel click: go back in explorer - (by: Plankoe)
~MButton:: {
    if IsExplorerEmptySpace() {
        Send("!{Up}") 
        return
    }

    IsExplorerEmptySpace() {
        static ROLE_SYSTEM_LIST := 0x21

        if AccObj := AccObjectFromPoint() {
            return AccObj.accRole(0) = ROLE_SYSTEM_LIST
        }
    }

    AccObjectFromPoint() {
        static VT_DISPATCH := 9, F_OWNVALUE := 1, h := DllCall("LoadLibrary", "Str", "oleacc", "Ptr")

        DllCall("GetCursorPos", "int64*", &pt:=0)
        varChild := Buffer(8 + 2 * A_PtrSize, 0)

        if DllCall("oleacc\AccessibleObjectFromPoint", "Int64", pt, "Ptr*", &pAcc:=0, "Ptr", varChild) = 0 {
            return ComValue(VT_DISPATCH, pAcc, F_OWNVALUE)
        }
    }
}
; ----------------------------------------------------
; Everything Search - (by: Onurtag)
EverythingPath := "C:\Program Files\Everything 1.5a\Everything64.exe"

UserProfile := EnvGet("UserProfile")
MyFullName := ""

try {
    MyFullName := GetUserFullName()
} catch {
    MyFullName := ""
}

#HotIf WinActive("ahk_class WorkerW") or WinActive("ahk_class Progman")

!e:: {
    RunPath := "-p `"" . UserProfile . "\Desktop\`""
    Run(EverythingPath " " RunPath)

    if (!WinWait("ahk_exe everything.exe", , 2)) {
        return
    }

    Sleep(100)
    WinActivate("ahk_exe everything.exe")
}

#HotIf WinActive("ahk_class Shell_TrayWnd") or WinActive("ahk_class Shell_SecondaryTrayWnd")

!e:: {
    Run(EverythingPath)

    if (!WinWait("ahk_exe everything.exe", , 2)) {
        return
    }

    Sleep(100)
    WinActivate("ahk_exe everything.exe")
}

#HotIf WinActive("ahk_class CabinetWClass") or WinActive("ahk_class #32770")

!e:: {
    folderPath := GetActiveExplorerPath()
    param := ""
    
    if (folderPath && !InStr(folderPath, "::{")) {
        userFolder := UserProfile . "\" . folderPath

        switch {
            case FileExist(folderPath):
               param := "-p `"" . folderPath . "`""
            case FileExist(userFolder):
                param := "-p `"" . userFolder . ""
            case (MyFullName && RegExMatch(folderPath, "^" . MyFullName)):
                param := "-p `"" . UserProfile . "`""
            default: param := "" 
        }
    }

    Run(EverythingPath " " param)

    if (!WinWait("ahk_exe everything.exe", , 2)) {
        return
    }
      
    Sleep(100)
    WinActivate("ahk_exe everything.exe")
}

#HotIf

GetUserFullName() {
    username := A_UserName
    objWMI := ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
    result := objWMI.ExecQuery("SELECT * FROM Win32_UserAccount WHERE Name='" . username . "'")

    for item in result {
        return item.FullName
    }

    return ""
}

GetActiveExplorerPath() {
    hwnd := WinActive("ahk_class CabinetWClass")

    for w in ComObject("Shell.Application").Windows {
        if (w.hwnd == hwnd) {
            return w.Document.Folder.Self.Path
        }
    }
}
; ----------------------------------------------------

; ===========<Spotify>================================
; Spotify Controls - (by: Competitive_Tax_)
DetectHiddenWindows(1)

#HotIf WinActive("ahk_exe Spotify.exe") or CheckSpotify()

!^Left::SpotifyPlaybackPrevious ; Ctrl+Alt+Left -> Previous Track
!^Space::SpotifyPlaybackPlayPause ; Ctrl+Alt+Space -> Play/Pause
!^Right::SpotifyPlaybackNext ; Ctrl+Alt+Right -> Next Track

#HotIf

CheckSpotify() {
    return ProcessExist("Spotify.exe")
}

CheckSpotify()

SpotifyPlaybackNext() => SpotifyControl(0xB0000)
SpotifyPlaybackPrevious() => SpotifyControl(0xC0000)
SpotifyPlaybackPlayPause() => SpotifyControl(0xE0000)

SpotifyControl(action) {
    Spot_PID := CheckSpotify()

    static WM_APPCOMMAND := 0x319

    Spot_hwnd := WinGetID("ahk_pid " Spot_PID)

    if Spot_hwnd {
        DllCall("SendMessage", "Ptr", Spot_hwnd, "UInt", WM_APPCOMMAND, "Ptr", 0, "Ptr", action)
    }
}
; ----------------------------------------------------

; ===========<Writing>================================
; Space: Capitalize the first letter after score - (by: GroggyOtter)
:b0x?*:. ::
:b0x?*:! ::
:b0x?*:? ::cap_next_letter()

cap_next_letter() {
    hook := InputHook('B0')
    hook.KeyOpt('{All}', 'E')
    hook.Start()
    hook.Wait()
    value := hook.EndKey
    
    if (value is String && StrLen(value) = 1)
        Send('{' StrUpper(value) '}')
    else if (value != 'Delete' && value != 'Backspace')
        Send('{' value '}')
    if (value = 'Space')
        SetTimer(cap_next_letter, -1)
}
; ----------------------------------------------------

; ===========<Extras>=================================
; Alt+Ctrl+l: Clean Recycle Bin - (by: EvenAngelsNeed)
^!l:: {
    EmptyRecycleBin() {
        shell := ComObject("shell.application")
        bin := shell.Namespace(10)
        return bin.Items().Count
    }

    if EmptyRecycleBin() = 0 {
        return
    }

    DllCall("shell32.dll\SHEmptyRecycleBin")
}
; ---------------------------------------------------- 
