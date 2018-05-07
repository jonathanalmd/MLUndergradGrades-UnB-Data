library(kernlab)
library(e1071)
# https://www.analyticsvidhya.com/blog/2017/09/understaing-support-vector-machine-example-code/
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



train <- as.matrix(student_df_2017_1[,c(2:11)])
sc <- specc(train, centers=6)

sc
centers(sc)
size(sc)
withinss(sc)
train

plot(train, col=sc)

df <- data.frame(train)
class <- sc[1:length(sc)]
class <- replace(class, class == 1, 'a')
class <- replace(class, class == 2, 'b')
class <- replace(class, class == 3, 'c')
class <- replace(class, class == 4, 'd')
class <- replace(class, class == 5, 'e')
class <- replace(class, class == 6, 'f')
df["class"] <- class
ggplot(data = df, aes(x = exam1, y = exam2, colour = class)) + geom_point()



# SVM Classification
grades <- student_df_2017_1['finalgrade']
svm_model <- svm(student_df_2017_1[,c(2:11)], grades, probability = TRUE)

print(model)
summary(model)

# test
input_data = paste(getwd(),'data/wrangled_intro-cs-grades-2017_2.csv',sep='/')
student_df_2017_2 <- read.csv(input_data, header=TRUE)
student_df_2017_2 <- filter(student_df_2017_2, finalgrade != 'TJ')

pred <- predict(model, student_df_2017_2[,c(2:11)])
# (same as:)
#pred <- fitted(model)

# Check accuracy:
#table(pred, y)
print(pred)
print(student_df_2017_2)
table(pred, student_df_2017_2)







