##############################################
############## Set up folders ###############

# create new folder in WD
dir.create("Assignment_1")
dir.create("Assignment_2")

# create new folder in different directories
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Code")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Data")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Results")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Figures")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Code")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Data")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Results")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Figures")

# Set the current assignment as WD
Ass_1_WD <- "/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Quizzes and assignments/Assignment_1"
Ass_2_WD <- "/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Quizzes and assignments/Assignment_2"
setwd(Ass_1_WD)


##############################################
############ Load and handle data ############

# initialize renv
renv::init()
renv::snapshot()

# Install the tidyverse package
install.packages("tidyverse")

#Load the tidyverse library in your R script 
library(tidyverse)
library(dplyr)
library(ggplot2)

# Load the data set and save in data folder
iris_df <- iris
head(data_iris)
write.csv(iris_df, file = "Data/iris_df.csv", row.names = FALSE)

### Create a tibble data frame

### add some stats

### save as csv both og and updated





##############################################
################# Plot data ##################


# Scatter PLot
ggplot(data=data_iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

# facet by species
plot_iris1 <- ggplot(data=data_iris, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length and Width by Species") +
  theme_bw()
plot_iris1_facet <- plot_iris1 + facet_grid(. ~ Species)


## save plots
ggsave(filename = "Assignment_1/Figures/Iris_facet_species.png", plot = last_plot(), dpi = 300)


