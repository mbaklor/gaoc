import gaoc/aoc2025/day1/common
import gaoc/fileread

pub fn p2(filename: String) {
  fileread.read_input(filename)
  |> check_rotations()
}

pub fn check_rotations(s: List(String)) {
  check_rotations_loop(s, common.Solution(50, 0))
}

fn check_rotations_loop(s: List(String), solution: common.Solution) {
  case s {
    [] -> solution.hit_zero
    [st, ..rest] -> {
      common.handle_line(st, solution)
      |> count_0_passes(solution)
      |> check_rotations_loop(rest, _)
    }
  }
}

fn count_0_passes(num: Int, solution: common.Solution) -> common.Solution {
  case num, solution.current_number {
    0, _ | 100, _ -> common.Solution(0, solution.hit_zero + 1)
    x, _ if x > 99 ->
      count_0_passes(x - 100, common.Solution(x, solution.hit_zero + 1))
    x, y if x < 0 && y != 0 ->
      count_0_passes(x + 100, common.Solution(x, solution.hit_zero + 1))

    x, _ if x < 0 ->
      count_0_passes(x + 100, common.Solution(x, solution.hit_zero))
    _, _ -> common.Solution(num, solution.hit_zero)
  }
}
