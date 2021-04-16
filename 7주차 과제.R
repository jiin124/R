#1
str(airquality)
boxplot(airquality$Ozone)
boxplot(airquality$Ozone,main="오존",col="pink")
boxplot(airquality$Ozone,horizontal=TRUE,main="오존",col="pink")

#2


#2-1
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
S<-c(1:10,1:10)
S

A=subset(S,S%%2==0);A
B<-S[11:20];B
C=subset(S,S<5)

#3-1
intersect(A,B,C)

#3-2
union(A,B,C)

#3-3
intersect(A,union(B,C))




