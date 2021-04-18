#1
str(airquality)
boxplot(airquality$Ozone)
boxplot(airquality$Ozone,main="오존",col="pink")
boxplot(airquality$Ozone,horizontal=TRUE,main="오존",col="pink")

#2


#2-1
library(prob)
S<-rolldie(1)
nrow(S)

#2-2
A=subset(S,S%%2==0)
B=subset(S,S/2==1 |S/3==1|S/5==1)
intersect(A,B)

#2-3
union(A,B)

#2-4
setdiff(S,A)
intersect(setdiff(S,A),B$X1)



#3

red<-data.frame(color=c("red","red","red","red","red","red","red","red","red","red"),num=c(1:10))
red
blue<-data.frame(color=c("blue","blue","blue","blue","blue","blue","blue","blue","blue","blue"),num=c(1:10))
blue

S<-rbind(red,blue);S

A=subset(S,S$num%%2==0);A
B=subset(S,S$color=='blue');B
C=subset(S,S$num<5);C

#3-1
merge(merge(A,B),C)

#3-2
merge(merge(A,B,all=T),C,all=T)

#3-3
merge(merge(B,C,all=T),A)