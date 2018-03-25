library('tidyverse')

set_wdir <- function() {
  library(rstudioapi) 
  current_path <- getActiveDocumentContext()$path 
  setwd(dirname(current_path ))
  print( getwd() )
}

set_wdir()
input_data = paste(getwd(),'data/wrangled_intro-cs-grades-2017_1.csv',sep='/')
student_df_2017_1 <- read.csv(input_data, header=TRUE)
head(student_df_2017_1)

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = year, y = exam1, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = finalscore, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam2, y = finalscore, colour = finalgrade))


ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = exam2, size = finalscore, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = exam2, size = finalscore, colour = finalscore))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = year, fill = finalgrade, y = ..prop.., group = finalgrade))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = finalgrade, y = ..prop.., group = 1))


