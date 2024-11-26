# create new folder in WD
dir.create("Quizzes")

# Initialize renv for the project
library(renv)
renv::init()

# Install required packages
renv::install(c("ggplot2", "dplyr", "tidyr"))

# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Create a dataset with additional variables
set.seed(456)
data <- data.frame(
  x = rnorm(100),
  category = sample(c("A", "B", "C"), 100, replace = TRUE)
) %>% mutate(y = 2 * x + rnorm(100))

# Perform data manipulation using tidyverse
data_summary <- data %>%
  group_by(category) %>%
  summarise(
    mean_x = mean(x),
    sd_y = sd(y),
    n = n()
  )

# Print the summary table
print(data_summary)




### Quiz ggplot2

# Example data for testing
set.seed(123)
students_data <- data.frame(
  ID = seq(1, 100),
  Age = rnorm(100, mean = 20, sd = 2),
  Score = rnorm(100, mean = 75, sd = 10),
  Subject = sample(c("Math", "English", "Science"), 100, replace = TRUE)
)

# Load the ggplot2 library
library(ggplot2)

# Example ggplot code
gg <- ggplot(students_data, aes(x = Age, y = Score, color = Subject)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
  labs(
    title = "Student Performance",
    x = "Age",
    y = "Score",
    color = "Subject"
  ) +
  theme_minimal()

# Display the plot
print(gg)
