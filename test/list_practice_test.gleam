import gleeunit
import list_practice

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn sum_list_test() {
  let numbers = [1, 2, 3, 4, 5]

  assert list_practice.sum_list_rec(numbers) == 15
  assert list_practice.sum_list_fold(numbers) == 15
  assert list_practice.sum_list_rec([]) == 0
  assert list_practice.sum_list_fold([]) == 0
}

pub fn evens_test() {
  let numbers = [1, 2, 3, 4, 5]

  assert list_practice.evens_rec(numbers) == [2, 4]
  assert list_practice.evens_filter(numbers) == [2, 4]
  assert list_practice.evens_rec([]) == []
  assert list_practice.evens_filter([]) == []
}
