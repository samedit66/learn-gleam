import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
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

pub fn slugify(s: String) -> String {
  s
  |> string.split(on: " ")
  |> list.map(fn(word) {
    word
    |> string.to_graphemes
    |> list.filter(is_latin_letter)
    |> string.join(with: "")
    |> string.lowercase
  })
  |> string.join(with: "-")
}

fn is_latin_letter(grapheme: String) -> Bool {
  let assert Some(a_code) = code_point(of: "a")
  let assert Some(z_code) = code_point(of: "z")
  case code_point(of: string.lowercase(grapheme)) {
    None -> False
    Some(code) -> a_code <= code && code <= z_code
  }
}

fn code_point(of grapheme: String) -> Option(Int) {
  case grapheme {
    "" -> None
    _ -> {
      let assert [first, ..] = string.to_utf_codepoints(grapheme)
      Some(string.utf_codepoint_to_int(first))
    }
  }
}

pub fn truncate(
  text: String,
  up_to count: Int,
  end_with suffix: String,
) -> String {
  text
  |> string.to_option
  |> option.map(fn(text) {
    text
    |> take_first(count - string.length(suffix))
    |> string.append(suffix)
  })
  |> option.unwrap("")
}

fn take_first(text: String, n: Int) -> String {
  let drop_count = string.length(text) - n
  case drop_count <= 0 {
    True -> text
    False -> string.drop_end(text, up_to: drop_count)
  }
}

pub fn to_snake_case(camel_case_text: String) {
  let letters =
    camel_case_text
    |> string.to_graphemes

  let last_index = list.length(letters) - 1
  let words_indexes =
    letters
    |> list.zip(list.range(0, last_index))
    |> list.filter_map(fn(letter_and_i) {
      let #(letter, i) = letter_and_i

      case is_upper_letter(letter) {
        True -> Ok(i)
        False -> Error(Nil)
      }
    })
    |> list.prepend(0)
    |> list.append([last_index + 1])
    |> list.window_by_2

  let words =
    words_indexes
    |> list.map(fn(start_and_end) {
      let #(start, end) = start_and_end
      string.slice(camel_case_text, start, end - start)
    })

  words |> list.map(string.lowercase) |> string.join("_")
}

fn is_upper_letter(grapheme: String) -> Bool {
  is_latin_letter(grapheme) && grapheme == string.uppercase(grapheme)
}

fn is_lower_letter(grapheme: String) -> Bool {
  is_latin_letter(grapheme) && grapheme == string.lowercase(grapheme)
}
