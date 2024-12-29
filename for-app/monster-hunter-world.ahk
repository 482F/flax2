#HotIf WinActive('ahk_exe MonsterHunterWorld.exe')

vk1D & w:: {
  util.key.down("w")
}
vk1D & XButton2::m

vk1D & 1::5
vk1D & 2::6
vk1D & 3::7
vk1D & 4::8

vk1D & Space:: {
  util.key.down("Space")
}

v:: {
  util.key.down("v")
}

~*LButton:: {
  util.key.up("v")
}
~*LCtrl:: {
  util.key.up("v")
}

vk1D & BackSpace:: {
  util.ttmenu()
    .register("自動導き採掘", autoMine)
    .register("自動蒸気機関", autoSteam)
    .show()

  autoMine() {
    mine() {
      sleep(1000)

      ; サイン
      util.key.tap("F3")
      util.key.tap("8")

      util.key.tap("e")

      ; マップが開けるかで鉱脈の有無を確認
      util.key.tap("m")
      sleep(2000)
      if (pixelGetColor(1469, 964) == "0x0E0707") {
        util.key.tap("Esc")
        sleep(500)
        return
      }

      sleep(4000)
      util.key.tap("e")
      sleep(6000)
      util.key.tap("e")
      sleep(6000)
    }
    while (true) {
      ; 地図から導きの地 3 番キャンプへ
      util.key.tap("m", , 2000)
      util.key.tap("f", , 1300)
      util.key.tap("Up", , 100)
      util.key.tap("Left", , 100)
      util.key.tap("Enter", , 100)
      util.key.tap("Down", , 100)
      util.key.tap("Enter", , 1000)
      util.key.tap("Enter", , 1000)
      util.key.tap("Enter", , 10000)

      while (pixelGetColor(100, 100, "Slow") == "0x000000") {
        sleep(1000)
      }
      sleep(5000)

      ; 隠れ身の装衣を使用
      util.key.tap("F2")
      util.key.tap("1")

      util.key.down("v") ; ダッシュ
      ; テントを出た地点からキャンプの出口へ
      util.key.down("w")
      sleep(2000)
      util.key.down("d")
      sleep(3000)
      util.key.up("d")
      sleep(2000)
      ; 陸珊瑚の採掘エリアへ
      util.key.down("d")
      sleep(19000)
      util.key.up("w")
      sleep(10000)
      util.key.down("s")
      sleep(1600)
      util.key.up("d")
      util.key.up("s")

      ; のろしを使用
      util.key.tap("F3")
      util.key.tap("5")
      sleep(15000)

      mine()

      ; 次の採掘エリアへ
      util.key.up("d")
      util.key.up("s")
      sleep(3000)
      util.key.down("a")
      sleep(7000)
      util.key.down("s")
      sleep(6000)
      util.key.up("s")
      util.key.up("a")

      mine()

      ; 次の採掘エリアへ
      util.key.down("s")
      sleep(5000)
      util.key.down("a")
      sleep(2000)
      util.key.up("a")
      sleep(1150)
      util.key.up("s")

      mine()

      ; 次の採掘エリアへ
      util.key.down("s")
      sleep(1000)
      util.key.up("s")
      util.key.down("a")
      sleep(8000)
      util.key.down("s")
      sleep(1200)
      util.key.up("s")
      util.key.up("a")

      mine()

      ; 帰還
      util.key.tap("Esc")
      util.key.tap("Esc", , 500) ; 二度押すと早く表示される
      util.key.tap("Right", , 300)
      util.key.tap("Down", , 300)
      util.key.tap("Down", , 300)
      util.key.tap("Enter", , 1000)
      util.key.tap("Enter", , 12000)

      ; リザルト
      util.key.tap("Enter", , 1000)
      util.key.tap("Down", , 250)
      util.key.tap("Down", , 250)
      util.key.tap("Down", , 250)
      util.key.tap("Down", , 250)
      util.key.tap("Enter", , 1000)
      util.key.tap("Left", , 250)

      while (pixelGetColor(100, 100, "Slow") != "0x000000") {
        util.key.tap("Enter", , 100)
        sleep(900)
        if (10 <= a_index) {
          break
        }
      }
      while (pixelGetColor(100, 100, "Slow") == "0x000000") {
        sleep(1000)
      }
      sleep(5000)
    }
  }
  autoSteam() {
    util.key.down("Space")
    while (getKeyState("Space")) {
      util.key.tap("x", , 1000)
    }
  }
}

#HotIf
