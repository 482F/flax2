DetectHiddenWindows true

#Include "%A_ScriptDir%"
#Include "lib\index.ahk"

#Include "for-app\astroneer.ahk"
#Include "for-app\edf6.ahk"
#Include "for-app\monster-hunter-world.ahk"
#Include "for-app\wild-hearts.ahk"

; C: 大文字小文字を区別, ?: 他の単語中でも発火
#Hotstring C ?

::flax2reload:: {
  reload()
}
