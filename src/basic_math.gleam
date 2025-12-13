pub fn add(a: Int, b: Int) -> Int {
  a + b
}

pub fn sub(a: Int, b: Int) -> Int {
  a - b
}

pub fn mul(a: Int, b: Int) -> Int {
  a * b
}

pub fn div_safe(a: Int, b: Int) -> Result(Int, String) {
  case b {
    0 -> Error("You cannot divide by zero, fool!")
    _ -> Ok(a / b)
  }
}

pub fn pow(a: Int, b: Int) -> Result(Int, String) {
  case a, b {
    _, 0 -> Ok(1)
    _, 1 -> Ok(a)
    _, b if b < 0 ->
      Error("You are not allowed to compute negative power, fool!")
    _, _ -> {
      let assert Ok(result) = pow(a, b - 1)
      Ok(a * result)
    }
  }
}
