import file_streams/file_stream.{type FileStream}
import file_streams/file_stream_error
import gleam/list
import gleam/string

pub fn read_input(filename: String) {
  let assert Ok(stream) = file_stream.open_read(filename)
  let assert Ok(li) = file_list(stream, [])
  list.reverse(li)
}

pub fn file_list(stream: FileStream, col: List(String)) {
  case file_stream.read_line(stream) {
    Error(file_stream_error.Eof) -> Ok(col)
    Error(e) -> Error(e)
    Ok(line) -> file_list(stream, [string.trim(line), ..col])
  }
}
