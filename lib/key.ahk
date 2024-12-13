class _key {
  static down(key) {
    while (getKeyState(key, "P")) {
      sleep(100)
    }
    send("{Blind}{" . key . " down}")
  }
  static up(key) {
    send("{Blind}{" . key . " up}")
  }
  static toggle(key) {
    while (getKeyState(key, "P")) {
      sleep(100)
    }

    if (getKeyState(key)) {
      _key.up(key)
    } else {
      _key.down(key)
    }
  }
}

util.key := _key
