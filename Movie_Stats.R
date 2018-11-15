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

t1 <- table(factor(dfmovie$V2, levels = c('RalphBreaksTheInternet', 'Creed2', 'RobinHood','GreenBookMovie','TheFrontRunner')))
t1df = data.frame(t1)
t1df
t2 <- table(dfmovie$V1)
t2
t2df = data.frame(t2)
t2df
fit <- lm(y ~ x1 + x2 + x3, data=t1df)
summary(fit) # show result
geom_col(dfmovie,aes(table(factor(dfmovie$V2, levels = c('RalphBreaksTheInternet', 'Creed2', 'RobinHood','GreenBookMovie', 'TheFrontRunner')))) 
 + labs(x = "Frequency", y = "Number of Tweets" ) +ggtitle("Hashtag Frequency"))

summary(dfmovie)
#Movie frequency of movie tweets
ggplot(data = t1df) + 
  geom_col(aes(x = t1df$Var1, y = t1df$Freq, fill = Freq, colours="red"))
#Days of tweets
ggplot(data = t2df) + 
  geom_col(aes(x = t2df$Var1, y = t1df$Freq, fill = Freq, colours="red"))

