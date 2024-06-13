exam_data <- data.frame(
  name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
  score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
  attempts = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
  qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)

extracted_data <- exam_data[c(3, 5), c(1, 3)]
print("Extracted 3rd and 5th rows with 1st and 3rd columns:")
print(extracted_data)

exam_data$country <- c("USA", "USA", "USA", "USA", "UK", "USA", "USA", "India", "USA", "USA")
print("Data frame after adding 'country' column:")
print(exam_data)

new_exam_data <- data.frame(
  name = c('Robert', 'Sophia'),
  score = c(10.5, 9),
  attempts = c(1, 3),
  qualify = c('yes', 'no'),
  country = c('USA', 'USA')  # Ensure 'country' column is included
)
updated_exam_data <- rbind(exam_data, new_exam_data)
print("Data frame after adding new rows:")
print(updated_exam_data)

sorted_exam_data <- updated_exam_data[order(updated_exam_data$name, updated_exam_data$score), ]
print("Sorted data frame by name and score:")
print(sorted_exam_data)

write.csv(sorted_exam_data, "exam_data.csv", row.names = FALSE)
loaded_exam_data <- read.csv("exam_data.csv")
print("Data frame loaded from the file 'exam_data.csv':")
print(loaded_exam_data)

