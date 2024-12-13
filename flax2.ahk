DetectHiddenWindows true

#Include "%A_ScriptDir%"

@include-all lib@
@include-all for-app@
@include-all module@

; C: 大文字小文字を区別, ?: 他の単語中でも発火
#Hotstring C ?

::flax2reload:: {
  reload()
}

