#HotIf WinActive('ahk_exe KeepDigging-Win64-Shipping.exe')

~Enter::{
  while (getKeyState("Enter")) {
    util.key.tap("f", 10, 10)
  }
}
#HotIf
