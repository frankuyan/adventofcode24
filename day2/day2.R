# Function to check if a report is safe
is_safe_report <- function(report) {
  n <- length(report)
  
  # Check for monotonicity (either increasing or decreasing)
  is_increasing <- TRUE
  is_decreasing <- TRUE
  
  for (i in 2:n) {
    diff <- report[i] - report[i-1]
    
    if (diff < 1 || diff > 3) {
      return(FALSE)  # If any difference is less than 1 or greater than 3, it's unsafe
    }
    
    if (diff > 0) {
      is_decreasing <- FALSE
    } else if (diff < 0) {
      is_increasing <- FALSE
    }
  }
  
  # The report is safe if it's either all increasing or all decreasing
  return(is_increasing || is_decreasing)
}

# Function to count the number of safe reports
count_safe_reports <- function(data) {
  safe_count <- 0
  
  for (report in data) {
    if (is_safe_report(report)) {
      safe_count <- safe_count + 1
    }
  }
  
  return(safe_count)
}

# Read data from inputs.txt
data <- readLines("/Users/frankyan/adventofcode24/day2/input.txt")

# Convert the data to a list of vectors
reports <- lapply(data, function(x) as.numeric(unlist(strsplit(x, " "))))

# Count the number of safe reports
safe_count <- count_safe_reports(reports)
print(safe_count)
