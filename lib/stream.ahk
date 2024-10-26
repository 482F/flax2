class _stream {
  static start(arr) {
    return _stream(arr)
  }
  __New(arr) {
    this.arr := arr
  }
  map(func) {
    newarr := []
    for value in this.arr {
      newarr.push(func(value))
    }
    return _stream(newarr)
  }
  reduce(func, initial) {
    result := initial
    for value in this.arr {
      result := func(result, value)
    }
    return result
  }
  collect() {
    return this.arr
  }
}

util.stream := _stream
