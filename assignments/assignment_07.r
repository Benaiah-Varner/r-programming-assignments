data(mtcars)
head(mtcars, 6)

class(mtcars)
mode(mtcars)
typeof(mtcars)
isS4(mtcars)

# summary() is an S3 generic if it has methods
methods("summary")
getS3method("summary", "data.frame")

# show "no method for my class" situation
x <- list(df = mtcars)
class(x) <- "CarBundle"
summary(x)                     # will fall back to summary.default
exists("summary.CarBundle")    # FALSE (no class-specific method)

# S3 example
CarBundle <- function(df) {
  out <- list(df = df)
  class(out) <- "CarBundle"
  out
}

print.CarBundle <- function(x, ...) {
  cat("CarBundle\n")
  cat("rows:", nrow(x$df), "cols:", ncol(x$df), "\n")
  invisible(x)
}

cb <- CarBundle(mtcars)
cb

# S4 example
setClass("CarBundleS4", slots = c(df = "data.frame"))
cb4 <- new("CarBundleS4", df = mtcars)

setGeneric("mpg_mean", function(obj) standardGeneric("mpg_mean"))
setMethod("mpg_mean", "CarBundleS4", function(obj) mean(obj@df$mpg))

isS4(cb4)
isGeneric("mpg_mean")
mpg_mean(cb4)
