import gleam/io
import gleam/option.{None, Some}
import hello.{hello}
import string_toolbox.{to_snake_case}

pub fn main() -> Nil {
  io.println("Hello from learn_gleam!")

  io.println("Exercise #1:")
  io.println(hello(Some("Bob")))
  io.println(hello(None))

  io.println(to_snake_case("someOtherWordsInMethodName"))
}
