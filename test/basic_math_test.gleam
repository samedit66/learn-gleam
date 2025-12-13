import basic_math
import gleam/result
import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn add_test() -> Nil {
  let a = 1
  let b = 2
  let result = 3

  assert basic_math.add(a, b) == result
  assert basic_math.add(b, a) == result
}

pub fn sub_test() -> Nil {
  let a = 10
  let b = 5
  let result1 = 5
  let result2 = -5

  assert basic_math.sub(a, b) == result1
  assert basic_math.sub(b, a) == result2
}

pub fn mul_test() -> Nil {
  let a = 7
  let b = 3
  let result = 21

  assert basic_math.mul(a, b) == result
  assert basic_math.mul(b, a) == result
}

pub fn div_safe_test() -> Nil {
  let a = 10
  let b = 5
  let c = 0
  let result = Ok(2)

  assert basic_math.div_safe(a, b) == result
  assert basic_math.div_safe(a, c) |> result.is_error
}

pub fn pow_test() -> Nil {
  assert basic_math.pow(2, 0) == Ok(1)
  assert basic_math.pow(2, 1) == Ok(2)
  assert basic_math.pow(2, 4) == Ok(16)
  assert basic_math.pow(2, -5) |> result.is_error
}
