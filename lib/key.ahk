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
  static tap(key, downMs := 100, sleepMs := 100) {
    util.key.down(key)
    sleep(downMs)
    util.key.up(key)
    sleep(sleepMs)
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
