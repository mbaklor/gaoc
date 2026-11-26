import gaoc/aoc2025/day1/part1
import gaoc/aoc2025/day1/part2
import gleam/int
import gleam/io

pub fn main() {
  part1.p1("data/2025/day1/input.txt")
  |> int.to_string()
  |> io.println()

  part2.p2("data/2025/day1/input.txt")
  |> int.to_string()
  |> io.println()
}
