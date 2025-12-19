#HotIf WinActive('ahk_exe EDF6.exe')

!LButton:: {
  util.key.down("LButton")
}

!RButton:: {
  util.key.down("RButton")
}

~*vk1D::[

vk1D & BackSpace:: {
  util.ttmenu()
    .register("自動出撃", autoStart)
    .show()

  autoStart() {
    waitLoadEnd(col) {
      while (pixelGetColor(1805, 10) != col) {
        sleep(100)
      }
      tooltip("col detected")
      while (pixelGetColor(1805, 10) == col) {
        sleep(100)
      }
      tooltip("col not detected")
    }
    while (true) {
      util.key.tap("Enter", , 1000)
      util.key.tap("Enter", , 1000)
      util.key.tap("Enter")
      waitLoadEnd("0x000000")
      tooltip("load ended0")
      waitLoadEnd("0x020801")
      tooltip("load ended1")
      sleep(2000)
      util.key.tap("Esc", , 1000)
      util.key.tap("s", , 300)
      util.key.tap("s", , 300)
      util.key.tap("Enter", , 1000)
      util.key.tap("a", , 300)
      util.key.tap("Enter")
      waitLoadEnd("0x000000")
      tooltip("load ended2")
      sleep(2000)
      util.key.tap("Enter")
      waitLoadEnd("0x000000")
      tooltip("load ended3")
      sleep(2000)
    }
  }
}

#HotIf
; 440-53
