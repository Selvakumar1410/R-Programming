data(ChickWeight)

# Order the data frame by weight, grouped by diet
ordered_data <- ChickWeight[order(ChickWeight$Diet, ChickWeight$weight), ]

# Extract the last 6 records
last_six <- tail(ordered_data, 6)
print(last_six)

#2a) Melt the data with Chick, Time, and Diet as ID variables
melted_data <- melt(ChickWeight, id.vars = c("Chick", "Time", "Diet"))
print(head(melted_data))

#2b) Cast the data to display mean weight grouped by Diet
mean_weight_by_diet <- dcast(melted_data, Diet ~ variable, mean)
print(mean_weight_by_diet)

#2c) Cast the data to display mode of weight grouped by Diet
mode_weight_by_diet <- dcast(melted_data, Diet ~ variable, fun.aggregate = mode)
print(mode_weight_by_diet)