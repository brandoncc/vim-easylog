const a = {
  "a": 1,
  "b": 2,
  "c": [1, 2, 3, [1, 2, 3]],
  "d": {
    "c": 1
  }
}
console.log("a", a)
console.log("a: ", Object.prototype.toString.call(a))
