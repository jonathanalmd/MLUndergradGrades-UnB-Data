library('tidyverse')

source("set_wdir.r")
set_wdir()
input_data = paste(getwd(),'data/wrangled_intro-cs-grades-2017_1.csv',sep='/')
student_df_2017_1 <- read.csv(input_data, header=TRUE)
head(student_df_2017_1)

ggplot(student_df_2017_1) + geom_point(mapping = aes(x = year, y = exam1, colour = finalgrade))
