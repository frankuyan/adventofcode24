

count_occurrences_xmas <- function(grid) {
  search_word <- function(start_row, start_col, delta_row, delta_col) {
    word <- "XMAS"
    for (i in 1:nchar(word)) {
      r <- start_row + (i-1) * delta_row
      c <- start_col + (i-1) * delta_col
      if (r < 1 || r > nrow(grid) || c < 1 || c > ncol(grid) || 
          grid[r, c] != substr(word, i, i)) {
        return(0)
      }
    }
    return(1)
  }
  
  directions <- list(
    c(-1, 0), c(1, 0), c(0, -1), c(0, 1),
    c(-1, -1), c(-1, 1), c(1, -1), c(1, 1)
  )
  
  total_count <- 0
  for (row in 1:nrow(grid)) {
    for (col in 1:ncol(grid)) {
      for (dir in directions) {
        total_count <- total_count + search_word(row, col, dir[1], dir[2])
      }
    }
  }
  return(total_count)
}

# Example grid
grid_text <- "day4/input.txt"

# Convert to matrix
grid <- do.call(rbind, strsplit(grid_text, ""))

# Count occurrences
result <- count_occurrences_xmas(grid)
print(result)