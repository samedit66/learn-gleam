import gleeunit
import string_toolbox.{is_palindrome, reverse_string}

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
