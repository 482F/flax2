#HotIf WinActive('ahk_exe noita.exe')

~+RButton:: {
  util.key.tap(":", 5, 5)
}

~RButton:: {
  while (getKeyState("RButton", "P")) {
    util.key.tap(":", 5, 5)
    sleep(100)
  }
}

XButton1::RButton

#HotIf
