#### setup folders

getwd()
mainWD <- getwd()
setwd(mainWD)
Ass_1_WD <- setwd("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1")
Ass_2_WD <- setwd("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2")
  
# create new folder in WD
dir.create("Assignment_1")
dir.create("Assignment_2")

# create new folder in different p
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Code")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Data")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Results")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_1/Figures")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Code")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Data")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Results")
dir.create("/Users/k6-yjwyh2vnmc/Library/CloudStorage/OneDrive-KarolinskaInstitutet/KI Work/PhD stuff/Courses/Intermediate R/R_version_control/Github_connected/Assignment_2/Figures")



#### Assigment 1

# initialize renv
renv::init()
renv::snapshot()

# Install the tidyverse package
install.packages("tidyverse")

#Load the tidyverse library in your R script 
library(tidyverse)
library(dplyr)
library(ggplot2)

data_iris <- iris
head(data_iris)


### Scatter PLot
ggplot(data=data_iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

## facet by species
plot_iris1 <- ggplot(data=data_iris, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length and Width by Species") +
  theme_bw()
plot_iris1_facet <- plot_iris1 + facet_grid(. ~ Species)

ggsave(filename = "Assignment_1/Figures/Iris_facet_species.png", plot = last_plot(), dpi = 300)


