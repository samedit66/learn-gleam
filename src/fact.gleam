pub fn fact_rec(n: Int) -> Int {
  case n {
    _ if n < 2 -> 1
    _ -> n * fact_rec(n - 1)
  }
}

pub fn fact_iter(n: Int) -> Int {
  fact_iter_helper(1, n)
}

fn fact_iter_helper(acc: Int, n: Int) {
  case n {
    0 -> acc
    _ -> fact_iter_helper(acc * n, n - 1)
  }
}
