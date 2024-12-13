class _hotkey {
  static once(dict) {
    dummy := true
    hotIf((*) => dummy)

    unassign() {
      for key, _ in dict.ownProps() {
        hotKey(key, "off")
      }
    }

    for key, _ in dict.ownProps() {
      f(key) {
        unassign()
        dict.%key%()
      }
      hotKey(key, f)
    }
  }
}

util.hotkey := _hotkey
