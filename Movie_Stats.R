library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(tidytext)
library(lubridate)
library(stringr)
library(httr)
library(tm)
MyData <- read.csv(file="C:/Users/rlicc/Desktop/ECSU_SEM_2/Bioinformatics/movie_data_com_11_12.csv", header=FALSE, sep=",")
MyData

dfmovie <- data.frame(MyData)
dfmovie



View(dfmovie)
t <-table(dfmovie$V2)
t
#Frequency Barplot
barplot(table(t1df$Var1))

t1 <- table(factor(dfmovie$V2, levels = c('RalphBreaksTheInternet', 'Creed2', 'RobinHood','GreenBookMovie')))
t1df = data.frame(t1)
t1df
t2 <- table(dfmovie$V1)
t2
t2df = data.frame(t2)
t2df
#Possible Multivariable Regression
fit <- lm(y ~ x1 + x2 + x3, data=t1df)
summary(fit) # show result
#Test Graph
geom_col(dfmovie,aes(table(factor(dfmovie$V2, levels = c('RalphBreaksTheInternet', 'Creed2', 'RobinHood','GreenBookMovie')))) 
 + labs(x = "Frequency", y = "Number of Tweets" ) +ggtitle("Hashtag Frequency"))

summary(dfmovie)
#Movie frequency of movie tweets
 geom_col(aes(x = t1df$Var1, y = t1df$Freq, fill = Freq))+ theme_classic()+xlab("Movie title Hashtags") +
  ylab("Number of Hashtags") + ggtitle("Movie Hashtag Frequencies")
#Days of tweets test
ggplot(data = t2df) + 
  geom_col(aes(x = t2df$Var1, y = t1df$Freq, fill = Freq))

