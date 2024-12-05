
library(dplyr) 


word_search <- "day4/input.txt"

count_XMAS <- function(grid) {
  n <- length(grid)
  m <- nchar(grid[[1]])
  word <- "XMAS"
  occurrences <- 0

  # Check rows
  for (row in grid) {
    occurrences <- occurrences + length(gregexpr(word, row, fixed = TRUE)[[1]])
    # Reverse the row for backward search
    rev_row <- rev(strsplit(row, "")[[1]]) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, rev_row, fixed = TRUE)[[1]])
  }

  # Check columns
  for (col in 1:m) {
    col_str <- sapply(grid, function(x) substr(x, col, col)) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, col_str, fixed = TRUE)[[1]])
    # Reverse the column string for backward search
    rev_col_str <- rev(strsplit(col_str, "")[[1]]) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, rev_col_str, fixed = TRUE)[[1]])
  }

  # Check diagonals
  for (d in (-n + 1):m) {
    diag <- sapply(
      max(d, 0):min(m - d, n - 1),
      function(x) substr(grid[[x + ifelse(d < 0, -d, 0)]], x + d - ifelse(d < 0, 0, d) + 1, x + d - ifelse(d < 0, 0, d) + nchar(word))
    ) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, diag, fixed = TRUE)[[1]])
    # Reverse the diagonal for backward search
    rev_diag <- rev(strsplit(diag, "")[[1]]) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, rev_diag, fixed = TRUE)[[1]])
  }

  # Check anti-diagonals
  for (d in 0:(n + m - 2)) {
    anti_diag <- sapply(
      max(d - m + 1, 0):min(d, n - 1),
      function(x) substr(grid[[x + 1]], m - (d - x), m - (d - x) + nchar(word) - 1)
    ) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, anti_diag, fixed = TRUE)[[1]])
    # Reverse the anti-diagonal for backward search
    rev_anti_diag <- rev(strsplit(anti_diag, "")[[1]]) %>% paste0(collapse = "")
    occurrences <- occurrences + length(gregexpr(word, rev_anti_diag, fixed = TRUE)[[1]])
  }

  return(occurrences)
}



count_XMAS(word_search)