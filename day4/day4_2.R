

library(stringr)

get_diagonal <- function(schema) {
  shifts <- lapply(seq_along(schema), function(i) substring(schema[i], i))
  diagonal <- paste(sapply(seq_along(shifts[[1]]), 
                          function(i) paste0(sapply(shifts, function(x) substr(x, i, i)), collapse="")), 
                   collapse=" ")
  return(diagonal)
}

# Read the data
wordsearch <- readLines("day4/input.txt")

Ly <- length(wordsearch)
Lx <- nchar(wordsearch[1])

# Part 1
horizontal <- paste(wordsearch, collapse=" ")
vertical <- paste(sapply(1:Lx, function(i) paste0(substr(wordsearch, i, i), collapse="")), collapse=" ")

pad <- paste(rep(".", Lx-1), collapse="")
padded <- paste0(pad, wordsearch, pad)
diagonal <- get_diagonal(padded)
antidiagonal <- get_diagonal(rev(padded))

full_schema <- paste(horizontal, vertical, diagonal, antidiagonal, collapse=" ")

# Count overlapping matches using positive lookahead
matches <- gregexpr("(?=(XMAS|SAMX))", full_schema, perl=TRUE)
print(length(attr(matches[[1]], "match.length")))