
##########################################
############### Ggplot task ############## 
##########################################

# Create directory
dir.create("../Quizzes and assignments/Tasks")
dir.create("../Quizzes and assignments/Tasks/Data")
dir.create("../Quizzes and assignments/Tasks/Figures")
dir.create("../Quizzes and assignments/Tasks/Code")

# Load librarys
library(ggplot2)
library(dplyr)

?theme


######## 1 Box plot with violins ########

# read the data
plot1 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot1.csv", header = T)

violin_plot <- ggplot(plot1) +
  geom_violin(aes(x = myaxis, y = value, fill = myaxis)) + # add the violin shape
  geom_boxplot(aes(x = myaxis, y = value, fill = myaxis), width = 0.1) +  # adds the box plot
  theme_bw() + # theme preset
  theme(legend.position = "none") + # removes the legend box
  ylab("Value") + # changes y axis label
  xlab("") + # removes x axis label
  ggtitle("Boxplot + Violin") # Adds plot title

# save the plot as pdf
ggsave(plot = violin_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot1_violin.pdf")


######## 2 Simple scatter plot ########

# read the data
plot2 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot2.csv", header = TRUE)

scatter_plot <- ggplot(plot2, aes(x = area, y = poptotal)) + # area on x axis, total pop on y axis, divided by state
  geom_point(aes(color = state, size = popdensity)) + # color each point by state, size by population density
  geom_smooth(se = F) + # did not fill by state in inital aes to be able to smooth for poptotal
  ylab("Population") + # changes y axis label
  xlab("Area") + # removes x axis label
  theme_bw() + 
  ggtitle("Scatterplot \n Area vs Population") + # Adds plot title
  scale_y_continuous(limits = c(0, 500000), labels = scales::number) + # changes y axis range and removes scientific numbering
  scale_x_continuous(limits = c(0.000, 0.100), breaks = c(0.000,0.025, 0.050, 0.075, 0.100)) # changes x axis range and where the ticks appear

# save the plot as pdf
ggsave(plot = scatter_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot2_scatter.pdf")

######## 3 Counts plot ########

# read the data
plot3 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot3.csv", header = TRUE)

# scatter but as factor?


######## 4 Divergent plot ########

# read the data
plot4 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot4.csv", header = TRUE)






######## 5 Lollipop chart ########

# read the data
plot5 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot5.csv", header = TRUE)





######## 6 Volcano plot ########

# read the data
plot6 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot6.csv", header = TRUE)


