library(ggplot2)

# reading the data
placement <- read.csv("Placement_Data_Full_Class.csv") 
head(placement) 
colnames(placement)
str(placement)


# SCATTER PLOT
ggplot(data=placement, aes(x= ssc_p, y = hsc_p)) + geom_point(shape = 22, color = "blue", fill = "red", size = 2)

# adding additional variables with aesthetics
ggplot(data=placement, aes(x= ssc_p, y = hsc_p)) + geom_point(aes(color = status, shape = gender))

# adding a smoother to the plot
ggplot(data=placement, aes(x= ssc_p, y = hsc_p)) + geom_point(aes(colour = status)) + geom_smooth(aes(colour = status))


# BAR CHART
ggplot(placement, aes(degree_t)) + geom_bar(aes(fill = degree_t))

ggplot(placement, aes(degree_t)) + geom_bar(aes(fill = status), position = "dodge")


# DOT PLOT
ggplot(placement, aes(degree_p)) + geom_dotplot(binwidth = 1)


# HISTOGRAM
ggplot(placement, aes(degree_p)) + geom_histogram(binwidth = 5, fill = "brown")

# frequency polygons use lines instead of bars
ggplot(placement, aes(degree_p)) + geom_freqpoly(binwidth = 5) 

# adding a wrapper
ggplot(placement, aes(degree_p)) + geom_histogram(aes(fill = status), binwidth = 5) + facet_wrap(~gender)


# DENSITY PLOT
ggplot(placement) + geom_density(aes(etest_p, fill = degree_t), alpha = 0.5) # alpha is used to make colour lighter


# BOX PLOT
ggplot(placement, aes(y = hsc_p)) + geom_boxplot(aes(fill = status)) + facet_grid(workex~gender)


# VIOLIN PLOT
ggplot(placement, aes(y = hsc_p)) + geom_violin(aes(x = status), fill = "orange")


# PIE CHART
ggplot(placement, aes(x = " ", fill = degree_t))+ geom_bar(width = 1) + coord_polar("y") + theme_void()


# HEATMAP
data <- placement[, c(3, 5, 8, 11)] # select columns with only numeric values
corr_matrix <- round(cor(data),2)
df_corr <- reshape2::melt(corr_matrix)
ggplot(data = df_corr) + geom_tile(mapping = aes(x=Var1, y=Var2, fill=value))


# SCATTERPLOT MATRIX
library("GGally")
ggcorr(data)
ggpairs(data)   # correlogram
ggscatmat(placement, columns = c(3,5,8,11), color = "status")


# MOSAIC PLOT
library(ggmosaic)
ggplot(placement) + geom_mosaic(aes(x = product(status, degree_t), fill = status))
