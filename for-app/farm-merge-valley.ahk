#HotIf WinActive('#farm-merge-valley ahk_exe chrome.exe')

x::RButton
Space::LButton

fmvProcessOrder(collect) {
  x := 0
  y := 0
  click("L")
  mouseGetPos(&x, &y)
  ; click("L", 681, 684) ; text
  if (collect) {
    click("L", 672, 573) ; voice
  }

  delta := 49
  if (655 < x) {
    mouseMove(x - delta * 6, y + delta)
  } else {
    mouseMove(x + delta, y)
  }
}

c:: {
  fmvProcessOrder(true)
}
!c:: {
  fmvProcessOrder(false)
}

#HotIf
