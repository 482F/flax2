#HotIf WinActive('ahk_exe MonsterHunterWilds.exe')

*!Up:: { ; スリンガー発射
  util.key.tap("NumPad2")
}
*!Enter:: { ; 集中攻撃
  util.key.tap("NumPad3")
}
*!WheelUp:: { ; 導虫アナウンス
  util.key.tap("PgUp")
}
*!WheelDown:: { ; 導虫アナウンス
  util.key.tap("PgDn")
}
^Tab:: { ; セクレトマニュアル移動
  util.key.tap("NumPad7")
}

vk1D & Tab::h ; 武器切り替え
vk1D & XButton2::m ; マップ
vk1D & Up::NumpadSub ; 弾丸スクロール
vk1D & Down::NumpadAdd ; 弾丸スクロール

vk1D & 1::7
vk1D & 2::8
vk1D & 3::9
vk1D & 4::0
vk1D & 5::-
vk1D & w::w
vk1D & a::a
vk1D & s::s
vk1D & d::d

; RE Framework timescale
vk1D & Insert:: {
  util.key.tap("NumpadDot")
}
NumpadDot:: {
  return
}

~*v:: {
  util.key.down("v")
}

~*LButton:: {
  util.key.up("v")
}
~*x:: {
  util.key.up("v")
}
~*LCtrl:: {
  util.key.up("v")
}

#HotIf
