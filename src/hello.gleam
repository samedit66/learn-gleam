import gleam/option.{type Option, None, Some}

/// Write a module hello with a function greet(name: String) -> String that returns
/// "Hello, <name>!".
/// Stretch: Accept Option(String) where None becomes "Hello, stranger!" .
pub fn hello(name: Option(String)) -> String {
  case name {
    Some(name) -> "Hello, " <> name <> "!"
    None -> "Hello, stranger!"
  }
}
