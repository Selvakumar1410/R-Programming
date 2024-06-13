library(ggplot2)
library(dplyr)
install.packages("titanic")
library(titanic)

# Load the Titanic dataset from the datasets package
data("Titanic")

# Convert the Titanic dataset to a data frame
titanic_df <- as.data.frame(Titanic)
# Bar chart to show details of "Survived" on the Titanic based on passenger Class
ggplot(titanic_df, aes(x = Class, y = Freq, fill = factor(Survived))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Survival on the Titanic by Passenger Class",
       x = "Passenger Class",
       y = "Frequency",
       fill = "Survived") +
  theme_minimal()
# Bar chart to show details of "Survived" on the Titanic based on passenger Class and Gender
ggplot(titanic_df, aes(x = Class, y = Freq, fill = factor(Survived))) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~Sex) +
  labs(title = "Survival on the Titanic by Passenger Class and Gender",
       x = "Passenger Class",
       y = "Frequency",
       fill = "Survived") +
  theme_minimal()


# Load the Titanic dataset from the titanic package
titanic_data <- titanic_train

# Draw histogram plot to show distribution of feature "Age"
ggplot(titanic_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Age on the Titanic",
       x = "Age",
       y = "Frequency") +
  theme_minimal()