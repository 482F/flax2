#HotIf WinActive('ahk_exe Infiroad.exe')

Enter:: {
  for char in strSplit('qwertyuiopasdfghjkl;:') {
    send('{ ' . char . ' down}')
  }
}

^Enter:: {
  while (true) {
    if (winActive('ahk_exe Infiroad.exe') == 0) {
      break
    }
    for char in strSplit('qwertyuiopasdfghjkl;:123456') {
      send('{ ' . char . ' down}')
    }
    sleep(1000 * 60 * 10)
    if (winActive('ahk_exe Infiroad.exe') == 0) {
      break
    }
    mouseClick("L", 194, 100)
    sleep(3000)
    mouseClick("L", 812, 655)
    sleep(3000)
    mouseClick("L", 970, 895)
    sleep(8000)
    mouseMove(100, 100)
  }
}

#HotIf
