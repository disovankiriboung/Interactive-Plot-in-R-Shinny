###### R Refre


x <- faithful[,2] #read dataset
summary(x) #summary statistics

hist(x, breaks=10, col="darkgray", border="white") #plotting a histrogram

bin = 5 #assigning bin
hist(x, breaks=bin, col="darkgray", border="white") 



#############
#Part 2
#install.packages("DT")
#install.packages("stargazer")
#install.packages("tidyverse")

library(shiny)
library(DT)
library(stargazer)
library(tidyverse)


download.file('https://ndownloader.figshare.com/files/26537294', 
              'Example2/data/framingham.csv') #download file
df <- read.csv('Example2/data/framingham.csv') #read file

df2 <- df %>%
  select("TOTCHOL","SYSBP","DIABP","HEARTRTE","BMI","GLUCOSE") #subset

#ploting method 1 - using $
plot(df2$TOTCHOL,df2$GLUCOSE) 
abline(lm(df2$TOTCHOL~df2$GLUCOSE))

#ploting method 2 - using [,]
plot(x=df2[,1],y=df2[,4], col="red", xlab=names(df2[4]))
abline(lm(df2[,4]~df2[,1],data=df2))

#stargazer
summary(reg1)
stargazer(reg1, type="text")
stargazer(df2, type = "text")


