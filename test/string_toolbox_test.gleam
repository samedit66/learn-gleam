import gleeunit
import string_toolbox.{is_palindrome, reverse_string, slugify, truncate}

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn reverse_string_test() {
  assert reverse_string("") == ""
  assert reverse_string("abc") == "cba"
}

pub fn is_palindrome_test() {
  assert is_palindrome("")
  assert !is_palindrome("abc")
  assert is_palindrome("А роза упала на лапу Азора")
}

pub fn slugify_test() {
  assert slugify("Hello World!") == "hello-world"
  assert slugify("") == ""
  assert slugify("a,b,-c, d") == "abc-d"
}

pub fn truncate_test() {
  assert truncate(
      "Hello, world! How are you today?",
      up_to: 10,
      end_with: "...",
    )
    == "Hello, wor..."
  assert truncate("", up_to: 5, end_with: "*") == ""
}
