import gleam/io
import gleam/option.{None, Some}
import hello.{hello}

pub fn main() -> Nil {
  io.println("Hello from learn_gleam!")

  io.println("Exercise #1:")
  io.println(hello(Some("Bob")))
  io.println(hello(None))
}
