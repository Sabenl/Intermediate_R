
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
  labs(subtitle="Area vs Population",
       title= "Scatterplot") + # Adds plot title
  scale_y_continuous(limits = c(0, 500000), labels = scales::number) + # changes y axis range and removes scientific numbering
  scale_x_continuous(limits = c(0.000, 0.100), breaks = c(0.000,0.025, 0.050, 0.075, 0.100)) # changes x axis range and where the ticks appear

# save the plot as pdf
ggsave(plot = scatter_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot2_scatter.pdf")

######## 3 Counts plot ########

# read the data
plot3 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot3.csv", header = TRUE)

counts_plot <- ggplot(plot3, aes(x = cty, y = hwy)) + 
  geom_count(color = "brown3") +
  labs(subtitle="mpg: city vs highway mileage",
       title= "Counts plot") + # Adds plot title
  theme_bw() + 
  theme(legend.position = "none") # removes the legend box# Adds plot title

# save the plot as pdf
ggsave(plot = counts_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot3_counts.pdf")


######## 4 Divergent plot ########

# read the data
plot4 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot4.csv", header = TRUE)

# compute normalized mpg
plot4$mpg_z <- round((plot4$mpg - mean(plot4$mpg))/sd(plot4$mpg), 2)
# above / below avg flag
plot4$mpg_type <- ifelse(plot4$mpg_z < 0, "below", "above")
# sort
plot4 <- plot4[order(plot4$mpg_z), ]
# convert to factor to retain sorted order in plot
plot4$car_name <- factor(plot4$car_name, levels = plot4$car_name)


bar_plot <- ggplot(plot4, aes(y = car_name, x = mpg_z, label = mpg_z)) +
  geom_bar(stat='identity', aes(fill = mpg_type)) +
  scale_fill_manual(name="Mileage",
                    labels = c("Above Average", "Below Average"),
                    values = c("above"="#97C48D", "below"="#f8766d")) +
  xlab("MPG (Z-score)") +
  ylab("Car Name") + 
  theme_bw()

# save the plot as pdf
ggsave(plot = bar_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot4_bar.pdf")


######## 5 Lollipop chart ########

# read the data
plot5 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot5.csv", header = TRUE)

lollipop_plot <- ggplot(plot5, aes(x = reorder(manufacturer, mileage), y = mileage)) + 
  geom_segment( aes(xend=manufacturer, yend=0), color= "grey") +
  geom_point(stat='identity', color="#E59845", size=3) + 
  theme_minimal() +
  scale_y_continuous(limits = c(0, 25), breaks = c(0, 5, 10, 15, 20, 25)) + # changes y axis range and breaks
  theme(panel.grid.minor.x = element_line(size = 0), 
        panel.grid.major.x = element_line(size = 0),
        axis.text.x = element_text(angle = 60, vjust = 0.8)) +
  xlab("") +
  ylab("Avg. Mileage") + 
  labs(subtitle="Average city mileage by manufacturer",
       title= "Lollipop Chart") # Adds plot title

# save the plot as pdf
ggsave(plot = lollipop_plot, path = "../Quizzes and assignments/Tasks/Figures/", device = "pdf", filename = "Plot5_lollipop.pdf")



######## 6 Volcano plot ########

# read the data
plot6 <- read.csv("../Quizzes and assignments/Tasks/Data/data_plot6.csv", header = TRUE)

# add -log10p column
plot6$neglog10p <- -log10(plot6$pvalue)

# add a column of NAs
plot6$diffexpressed <- "NO"
# if log2Foldchange > 0.5 and pvalue < 0.05, set as "UP" 
plot6$diffexpressed[plot6$log2FoldChange > 0.6 & plot6$pvalue < 0.05] <- "UP"
# if log2Foldchange < -0.5 and pvalue < 0.05, set as "DOWN"
plot6$diffexpressed[plot6$log2FoldChange < -0.6 & plot6$pvalue < 0.05] <- "DOWN"



# Scatter with l2fc and neglog10 p value
ggplot(data=plot6, aes(x=log2FoldChange, y=neglog10p, color = diffexpressed)) + 
  geom_point() +
  theme_classic() +
  ylab("-log10 (P-value)") +
  xlab("log2FC") +
  ggtitle("Volcano plot") +
  scale_color_manual(values=c("blue", "black", "red")) +
  theme(panel.background = element_rect(fill = "#F2F2F2"), 
        plot.title = element_text(hjust = 0.5))

        