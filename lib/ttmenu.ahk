class _ttmenu {
  __New(arr) {
    this.items := []
  }
  register(label, func) {
    this.items.push({ label: label, func: func })
    this.index := 0
    return this
  }
  show() {
    strs := []
    for item in this.items {
      cursor := (a_index == (this.index + 1)) ? '▶ ' : '　 '
      strs.push(cursor . item.label)
    }
    tooltip(util.array.join(strs, '`n'), , , 5)

    move(delta) {
      len := this.items.length
      this.index := mod(this.index + len + delta, len)
      this.show()
    }

    clear() {
      tooltip(, , , 5)
    }

    call() {
      clear()
      func := this.items[this.index + 1].func ; 直接呼び出すと this 引数が渡ってしまう
      func()
    }
    util.hotkey.once({
      down: (*) => move(1),
      up: (*) => move(-1),
      esc: (*) => clear(),
      enter: (*) => call()
    })
  }
}

util.ttmenu := _ttmenu
