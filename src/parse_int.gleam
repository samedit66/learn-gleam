import gleam/option.{type Option, None, Some}
import gleam/string

/// 8. Option / Result idioms
/// What: Implement parse_int(s: String) -> Option(Int)
/// Topics: Option, chaining, case expressions.
/// Difficulty: ★★☆
/// Hint: practice case and nested matches.
pub fn parse_int(s: String) -> Option(Int) {
  let trimmed = string.trim(s)
  case string.pop_grapheme(trimmed) {
    Error(Nil) -> None
    Ok(#(possible_sign, rest)) -> {
      case possible_sign {
        "+" -> parse_digits(rest, 0)
        "-" ->
          parse_digits(rest, 0)
          |> option.map(fn(number) { -number })
        _ -> parse_digits(trimmed, 0)
      }
    }
  }
}

fn parse_digits(s: String, number: Int) -> Option(Int) {
  case string.pop_grapheme(s) {
    Error(Nil) -> Some(number)
    Ok(#(possible_digit, rest)) -> {
      case char_to_digit(possible_digit) {
        Some(digit) -> parse_digits(rest, number * 10 + digit)
        None -> None
      }
    }
  }
}

fn char_to_digit(ch: String) -> Option(Int) {
  case ch {
    "0" -> Some(0)
    "1" -> Some(1)
    "2" -> Some(2)
    "3" -> Some(3)
    "4" -> Some(4)
    "5" -> Some(5)
    "6" -> Some(6)
    "7" -> Some(7)
    "8" -> Some(8)
    "9" -> Some(9)
    _ -> None
  }
}
