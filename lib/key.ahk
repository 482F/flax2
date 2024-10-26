class _key {
  static down(key) {
    while (getKeyState(key)) {
      sleep(100)
    }
    send("{" . key . " down}")
  }
}

util.key := _key
