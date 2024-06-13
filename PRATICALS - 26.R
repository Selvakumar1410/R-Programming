data(airquality)

is.data.frame(airquality)  # Output: TRUE

ordered_data <- airquality[order(airquality$Ozone, airquality$Solar.R), ]

reduced_data <- ordered_data[, !(names(ordered_data) %in% c("Solar.R", "Wind"))]

print(reduced_data)