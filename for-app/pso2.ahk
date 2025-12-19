#HotIf WinActive('ahk_exe pso2.exe')

~*Up::4
~*Down::5
~*Left::9
~*Right::0
vk1d & 1::6
vk1d & 2::7
vk1d & 3::8
vk1d & 4::9
vk1d & 5::0
!1::Numpad1
!2::Numpad2
!3::Numpad3
!4::Numpad4
!5::Numpad5
!6::Numpad6
!q::Numpad1
!w::Numpad2
!e::Numpad3
!a::Numpad4
!s::Numpad5
!d::Numpad6

!RButton:: {
  while (!getKeyState("RButton") && winGetProcessName("A") == "pso2.exe") {
    util.key.tap("RButton", , 200)
  }
}
#RButton:: {
  util.key.down("RButton")
}
#Enter:: {
  util.key.down("Enter")
}
#LButton:: {
  util.key.down("LButton")
}

#HotIf
