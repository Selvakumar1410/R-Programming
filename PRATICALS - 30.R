data(iris)

set.seed(123)
train_indices <- sample(nrow(iris), 0.8 * nrow(iris))
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

library(nnet)

model <- multinom(Species ~ Petal.Width + Petal.Length, data = train_data)

test_predictions <- predict(model, newdata = test_data, type = "prob")

predicted_species <- factor(levels(test_data$Species)[apply(test_predictions, 1, which.max)],
                            levels = levels(test_data$Species))

library(caret)
confusionMatrix(test_data$Species, predicted_species)

summary(model)