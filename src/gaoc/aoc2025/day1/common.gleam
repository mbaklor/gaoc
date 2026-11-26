import gleam/int

pub type Solution {
  Solution(current_number: Int, hit_zero: Int)
}

pub fn handle_line(st: String, solution: Solution) {
  case st {
    "L" <> rest -> solution.current_number - must_parse_int(rest)
    "R" <> rest -> solution.current_number + must_parse_int(rest)
    _ -> solution.current_number
  }
}

pub fn must_parse_int(s: String) {
  let assert Ok(i) = int.parse(s)
  i
}
