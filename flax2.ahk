DetectHiddenWindows true

#Include "%A_ScriptDir%"
#Include "lib\index.ahk"

#Include "module\astroneer.ahk"
#Include "module\wild-hearts.ahk"

; C: 大文字小文字を区別, ?: 他の単語中でも発火
#Hotstring C ?

::flax2reload:: {
  reload()
}
