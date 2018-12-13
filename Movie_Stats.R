library(ggplot2)
library(dplyr)
library(tidyr)
library(tidyverse)
library(tidytext)
library(ggpmisc)
library(scales)
MyData <- read.csv(file="C://combine.csv", header=FALSE, sep=",")
MyData
MovieFreq <- read.csv(file="C://Move_Freq_Rev.csv", header=TRUE, sep=",")
MovieFreq
MovieDays <- read.csv(file="C://Movie_days_hash.csv", header=TRUE, sep=",")

mf <- data.frame(MovieFreq)    #Freq and Revenue
dfmovie <- data.frame(MyData) #Full DatA
hashFr <-data.frame(MyData)
t8 <- table(hashFr)

########################################## Frequency#########

library(dplyr)
df <- filter(MyData, V1!="")

c <- group_by(df, V1, V2)

counts <- count(c)

t1 <- table(factor(dfmovie$V2, levels = c('RalphBreaksTheInternet', 'Creed2', 'RobinHood','GreenBookMovie')))
daysf = data.frame(t1)
daysf 
#colnames(daysf) <- c("title", "freq")
ggplot(t1df) + geom_bar(x = freq,y = title, fill = freq)
#frequency of hasgtags by title
ggplot(data = daysf) + 
  geom_col(aes(x = Var1, y = Freq, fill = Freq))+
  labs(title = "Frequency of Hashtags by Movie", x = "\nMovie Title", y = "Frequency\n") +
  theme_classic()





t5 <- table(dfmovie$V2)


t5
#write.csv(t5, file = "Move_Freq_Rev.csv")

#Linear regression
#This function puts Equatiion on Graph
lm_eqn <- function(mf, Rev, Hash){
  formula = as.formula(sprintf('%s ~ %s', Rev, Hash))
  m <- lm(formula, data=mf);
  # formating the values into a summary string to print out
  # ~ give some space, but equal size and comma need to be quoted
  eq <- substitute(italic(target) == b %.% italic(input) + a*"," ~~italic(r)^2~"="~r2*","~~p~"="~italic(pvalue), 
                   list(target = Rev,
                        input = Hash,
                        a = format(as.vector(coef(m)[1]), digits = 2), 
                        b = format(as.vector(coef(m)[2]), digits = 2), 
                        r2 = format(summary(m)$r.squared, digits = 3),
                        # getting the pvalue is painful
                        pvalue = format(summary(m)$coefficients[2,'Pr(>|t|)'], digits=1)
                   )
  )
  as.character(as.expression(eq));                 
}

#Linear Model
############################################################
#fit model
fit <- lm(Rev ~ Hash, data = mf)
summary(fit)
#model test
predict(fit, data.frame(Hash = 14057))
cor(mf$Rev,mf$Hash)
#linear graph with equation
ggplot(mf, aes(Hash, Rev) )+ geom_point() +
  geom_text(x=8000,y=10e+07,label=lm_eqn(mf, 'Rev','Hash'),color='red',parse=T)+
  geom_smooth(method = "lm") + theme_classic()+ xlab("Amount of Hashtags")+
  ylab("Revenue(in Millions)")+scale_y_continuous(labels = dollar)+
  ggtitle("Linear Regression Model for Revenue vs Hashtags")
 
  
 

#Graphs
############################################################################

View(counts)
counts2 <- table(counts$V1)
#Tweet trends per day
ggplot(counts, aes(x= V1,y=n, fill=V2)) +geom_col()+theme_classic()+ scale_x_discrete(labels= (1:15))+
 xlab("Days") +
  ylab("Number of Tweets") +
  ggtitle("Tweet Trends Per Day")

#write.csv(t1df, file = "Move_Freq.")

summary(dfmovie)

#Days of tweets
########################################################

days <- data.frame(MovieDays)

ggplot(data = days)+
  geom_col(aes(x = factor(X-1), y = Freq, fill = Freq)) + theme_classic()+ xlab("Days") +
  ylab("Frequency of Tweets") +
  ggtitle("Tweet Frequency Per Day")


#notes
##################################################



