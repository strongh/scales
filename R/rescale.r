#' Rescale numeric vector to have specified minimum and maximum.
#'
#' @param x numeric vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (numeric vector of length two).  If not given, is
#'   calculated from the range of \code{x}
#' @keywords manip
#' @export
rescale <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

#' Rescale numeric vector to have specified minimum, midpoint, and maximum.
#'
#' @export
#' @param x numeric vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (numeric vector of length two).  If not given, is
#'   calculated from the range of \code{x}
#' @param mid mid-point of input range
rescale_mid <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), mid = 0) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  extent <- 2 * max(abs(from - mid))
  (x - mid) / extent * diff(to) + mean(to)
}

#' Censor any values outside of range.
#'
#' @export
#' @param x numeric vector of values to manipulate.
#' @param range numeric vector of length two giving desired output range.
censor <- function(x, range = c(0, 1)) {
  ifelse(x >= range[1] & x <= range[2], x, NA)
}

#' Clip values to range.
#'
#' @author Homer Strong <homer.strong@@gmail.com>
#' @param x numeric vector of values to manipulate.
#' @param range numeric vector of length two giving desired output range.
#' @export
clip <- function(x, range = c(0, 1)) {
  x[x < range[1]] <- range[1]
  x[x > range[2]] <- range[2]
  x
}

#' Clip infinite values to range.
#'
#' @param x numeric vector of values to manipulate.
#' @param range numeric vector of length two giving desired output range.
#' @export
clip_infinite <- function(x, range = c(0, 1)) {
  x[x == -Inf] <- range[1]
  x[x == Inf] <- range[2]
  x
}

# Trim finite numbers to specified range
censor <- function(x, range) {
  x[x < range[1]] <- range[1]
  x[x > range[2]] <- range[2]
  x
}

# Determine if range of vector is FP 0.
zero_range <- function(x) {
  if (length(x) == 1) return(TRUE)
  x <- x / mean(x)
  isTRUE(all.equal(x[1], x[2]))
}
