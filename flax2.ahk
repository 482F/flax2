DetectHiddenWindows true

#Include "%A_ScriptDir%"

@include-all lib@
@include-all for-app@
@include-all module@
@include-remote nIME https://raw.githubusercontent.com/482F/winmisc/refs/heads/master/nIME.ahk sha256-PnlLjTRELVHgjX9hgIoHfzsjPBHzX3IF4RrdUOEJcaY=@

; C: 大文字小文字を区別, ?: 他の単語中でも発火
#Hotstring C ?

A_HotkeyInterval := 2000
A_MaxHotkeysPerInterval := 99999999 ; 2s 以内のホットキー実行数上限

::flax2reload:: {
  reload()
}

