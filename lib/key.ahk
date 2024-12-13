class _key {
  static down(key) {
    while (getKeyState(key, "P")) {
      sleep(100)
    }
    send("{Blind}{" . key . " down}")
  }
  }
}

util.key := _key
