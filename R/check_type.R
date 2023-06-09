## Shamelessly copied from utils.R of fastDummies
## following code is utils.R
check_type <- function(.data) {
  if (data.table::is.data.table(.data)) {
    data_type <- "is_data_table"
  } else if (tibble::is_tibble(.data)) {
    data_type <- "is_tibble"
  } else {
    data_type <- "is_data_frame"
  }

  return(data_type)
}

fix_data_type <- function(.data, data_type) {
  if (data_type == "is_data_frame") {
    .data <- as.data.frame(.data, stringsAsFactors = FALSE)
  } else if (data_type == "is_tibble") {
    .data <- tibble::as_tibble(.data)
  }

  return(.data)
}
