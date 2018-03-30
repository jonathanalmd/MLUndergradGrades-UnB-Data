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

student_df_2017_1 <- filter(student_df_2017_1, finalgrade != 'TJ')

head(student_df_2017_1)
summary(student_df_2017_1)

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = class, y = exam1, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = finalscore, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam2, y = finalscore, colour = finalgrade))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam2, y = finalscore, colour = class))

ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = exam2, colour = class))


ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = exam2, size = finalscore, colour = finalgrade))


ggplot(student_df_2017_1) +
  geom_point(mapping = aes(x = exam1, y = exam2, size = finalscore, colour = finalscore))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = year, fill = finalgrade, y = ..prop.., group = finalgrade))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = class, fill = finalgrade, y = ..prop.., group = finalgrade))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = finalgrade, y = ..prop.., group = 1))

finalgrade <- student_df_2017_1['finalgrade']
finalscore <- student_df_2017_1['finalscore']
student_df_2017_1 %>% 
  group_by(finalgrade) %>% 
  summarize(mean_rank=mean(finalscore),count=n()) 

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = finalgrade, fill = class, y = ..prop.., group = class))


ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = finalgrade, y = ..count.., group = 1))

ggplot(student_df_2017_1) +
  geom_bar(mapping = aes(x = finalgrade, y = ..prop.., group = 1))




