import gaoc/aoc2025/day1/common
import gaoc/fileread

pub fn p1(filename: String) {
  fileread.read_input(filename)
  |> check_zeros()
}

pub fn check_zeros(s: List(String)) {
  check_zeros_loop(s, common.Solution(50, 0))
}

fn check_zeros_loop(s: List(String), solution: common.Solution) {
  case s {
    [] -> solution.hit_zero
    [st, ..rest] -> {
      common.handle_line(st, solution)
      |> count_0_hits(solution)
      |> check_zeros_loop(rest, _)
    }
  }
}

fn count_0_hits(num: Int, solution: common.Solution) {
  case num {
    x if x > 99 -> count_0_hits(num - 100, solution)
    x if x < 0 -> count_0_hits(num + 100, solution)
    0 -> common.Solution(num, solution.hit_zero + 1)
    _ -> common.Solution(num, solution.hit_zero)
  }
}
