library(tidyverse)
data(iris)

dim(iris)

str(iris)

summary(iris)

sapply(iris[, 1:4], sd) 

data(iris)

iris_split <- split(iris, iris$Species)

sapply(iris_split, function(x) {
  group_mean <- sapply(x[, 1:4], mean)
  group_sd <- sapply(x[, 1:4], sd)
  return(cbind(group_mean, group_sd))
})
quantile(iris$Sepal.Width)

quantile(iris$Sepal.Length)

sepal_quantiles <- quantile(iris$Sepal.Length, probs = seq(0, 1, 0.25))

iris1 <- iris %>%
  mutate(Sepal.Length.Cate = cut(Sepal.Length, breaks = sepal_quantiles, labels = c("Q1", "Q2", "Q3", "Q4")))

head(iris1)

avg_by_groups <- iris1 %>%
  group_by(Species, Sepal.Length.Cate) %>%
  summarize(
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    avg_petal_length = mean(Petal.Length),
    avg_petal_width = mean(Petal.Width)
  )


print(avg_by_groups)

avg_mean_by_groups <- iris1 %>%
  group_by(Species, Sepal.Length.Cate) %>%
  summarize(avg_mean = mean(c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)))

print(avg_mean_by_groups)
pivot_table <- iris1 %>%
  group_by(Species, Sepal.Length.Cate) %>%
  summarize(count = n()) %>%
  spread(Sepal.Length.Cate, count, fill = 0)

print(pivot_table)