import fact
import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn fact_test() -> Nil {
  assert fact.fact_rec(0) == 1
  assert fact.fact_rec(1) == 1
  assert fact.fact_rec(3) == 6
  assert fact.fact_rec(5) == 120

  assert fact.fact_iter(0) == 1
  assert fact.fact_iter(1) == 1
  assert fact.fact_iter(3) == 6
  assert fact.fact_iter(5) == 120
}
