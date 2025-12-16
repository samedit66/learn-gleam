import gleam/option.{None, Some}
import gleeunit
import parse_int.{parse_int}

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn parse_int_test() -> Nil {
  assert parse_int("123") == Some(123)
  assert parse_int("-45") == Some(-45)
  assert parse_int("+7") == Some(7)
  assert parse_int("not a number at all") == None
  assert parse_int("    1241    \n") == Some(1241)
  assert parse_int("132132adasda") == None
}
