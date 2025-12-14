import gleam/float
import gleeunit
import shape

pub fn main() {
  gleeunit.main()
}

const tolerance = 0.001

pub fn area_test() {
  assert float.loosely_equals(shape.area(shape.Square(2.0)), 4.0, tolerance)
  assert float.loosely_equals(
    shape.area(shape.Rectangle(3.4, 3.6)),
    12.24,
    0.001,
  )
  assert float.loosely_equals(
    shape.area(shape.Circle(2.5)),
    19.634954084936208,
    tolerance,
  )
}
