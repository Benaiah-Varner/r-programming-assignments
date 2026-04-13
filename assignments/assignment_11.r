tukey.outlier <- function(x, k = 1.5) {
    q1 <- quantile(x, 0.25, na.rm = TRUE)
    q3 <- quantile(x, 0.75, na.rm = TRUE)
    iqr <- q3 - q1
    x < (q1 - k * iqr) | x > (q3 + k * iqr)
}

tukey_multiple <- function(x) {
    outliers <- array(TRUE, dim = dim(x))
    for (j in 1:ncol(x)) {
        outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
    }
    outlier.vec <- vector("logical", length = nrow(x))
    for (i in 1:nrow(x)) {
        outlier.vec[i] <- all(outliers[i, ])
    }
    return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)
