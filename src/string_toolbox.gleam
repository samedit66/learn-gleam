import gleam/list
import gleam/string

pub fn reverse_string(s: String) -> String {
  case string.pop_grapheme(s) {
    Ok(#(first, rest)) -> reverse_string(rest) <> first
    Error(Nil) -> ""
  }
}

pub fn is_palindrome(s: String) -> Bool {
  let transformed =
    s
    |> string.lowercase
    |> string.to_graphemes
    |> list.filter(fn(char) { char != " " })
    |> string.concat
  transformed == reverse_string(transformed)
}
