//// 3. Lists: map / filter / fold practice
//// What: Implement sum_list , evens , map_inc that respectively sum ints, filter evens, and add 1 to
//// every element using higher-order functions.
//// Topics: lists, List.map , List.filter , List.fold .
//// Difficulty: ★☆☆
//// Tests: empty and non-empty lists.
//// Hint: Explore List.fold for sum.

import gleam/list

pub fn sum_list_rec(n: List(Int)) -> Int {
  case n {
    [] -> 0
    [head, ..tail] -> head + sum_list_rec(tail)
  }
}

pub fn sum_list_fold(n: List(Int)) -> Int {
  list.fold(n, 0, fn(a, b) { a + b })
}

pub fn evens_rec(n: List(Int)) -> List(Int) {
  case n {
    [] -> []
    [head, ..tail] if head % 2 != 0 -> evens_rec(tail)
    [head, ..tail] -> [head, ..evens_rec(tail)]
  }
}

pub fn evens_filter(n: List(Int)) -> List(Int) {
  list.filter(n, fn(x) { x % 2 == 0 })
}

pub fn map_inc_rec(n: List(Int)) -> List(Int) {
  case n {
    [] -> []
    [x, ..xs] -> [x + 1, ..map_inc_rec(xs)]
  }
}

pub fn map_inc_map(n: List(Int)) -> List(Int) {
  list.map(n, fn(x) { x + 1 })
}
