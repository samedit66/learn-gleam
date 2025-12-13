import gleam/option.{None, Some}
import gleeunit
import hello

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn hello_person_test() -> Nil {
  let name = "Bob"
  let greeting = "Hello, Bob!"

  assert greeting == hello.hello(Some(name))
}

pub fn hello_stranger_test() -> Nil {
  let greeting = "Hello, stranger!"

  assert greeting == hello.hello(None)
}
