import gaoc/aoc2025/day1/part1
import gaoc/aoc2025/day1/part2

const base_dir = "data/2025/"

pub fn day1p1_test() {
  assert part1.p1(base_dir <> "/day1/example.txt") == 3
}

pub fn day1p2_test() {
  assert part2.p2(base_dir <> "/day1/example.txt") == 6
}
