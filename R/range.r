# Expand range
# Convenience function for expanding a range with a multiplicative or additive constant.
# 
# @arguments range of data
# @arguments multiplicative constract
# @arguments additive constant
# @arguments distance to use if range has zero width
# @keyword manip 
expand_range <- function(range, mul = 0, add = 0, zero = 0.5) {
  if (length(range) == 1 || diff(range) == 0) {
    c(range[1] - zero, range[1] + zero)
  } else {    
    range + c(-1, 1) * (diff(range) * mul + add)
  }
}

# Possibly expand range
# Convenience function for expanding a range to include a min and/or max value.
# 
# @arguments range of data
# @arguments desired_min the minimum value to include
# @arguments desired_max the maximum value to include
# @keyword manip 
include_in_range <- function(range, desired_min = range[1], desired_max = range[2]) {
  base::range(range, desired_min, desired_max)
}
