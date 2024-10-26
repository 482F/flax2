class util {
  class array {
    static join(arr, separator) {
      return substr(
        util.stream
          .start(arr)
          .reduce((all, part) => all . separator . part, ''),
        2
      )
    }
  }
  class string {
    static wrap(str, wrapper) {
      return wrapper . str . wrapper
    }
  }
}
