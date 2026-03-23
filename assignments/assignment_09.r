library(lattice)
library(ggplot2)

data("mtcars", package = "datasets")
df <- mtcars

# make a few variables easier to use as categories
df$cyl  <- factor(df$cyl)
df$gear <- factor(df$gear)
df$am   <- factor(df$am, labels = c("Automatic", "Manual"))

# base R

# mpg vs weight
plot(
    df$wt, df$mpg,
    main = "Base R: MPG vs Weight",
    xlab = "Weight (1000 lbs)",
    ylab = "Miles per Gallon",
    pch = 19
)


hist(
    df$hp,
    main = "Base R: Horsepower Distribution",
    xlab = "Horsepower"
)

# lattice

# same relationship split by cylinders
xyplot(
    mpg ~ wt | cyl,
    data = df,
    main = "Lattice: MPG vs Weight by Cylinder Count",
    xlab = "Weight (1000 lbs)",
    ylab = "Miles per Gallon",
    type = c("p", "r"),
    layout = c(3, 1)
)

bwplot(
    mpg ~ gear,
    data = df,
    main = "Lattice: MPG by Number of Gears",
    xlab = "Gears",
    ylab = "Miles per Gallon"
)

# ggplot2

# scatter with fitted line
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
    geom_point(size = 3) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(
        title = "ggplot2: MPG vs Weight with Trend Lines",
        x = "Weight (1000 lbs)",
        y = "Miles per Gallon",
        color = "Cylinders"
    )


ggplot(df, aes(x = hp)) +
    geom_histogram(binwidth = 25) +
    facet_wrap(~ gear) +
    labs(
        title = "ggplot2: Horsepower by Gear Group",
        x = "Horsepower",
        y = "Count"
    )