library(MASS)

#1
iris$Sepal.Length

#2
summary(iris$Sepal.Length)

#3-1
k<-1+log2(150);k

#3-2
floor(k)

#3-3,도수, 상대도수, 누적도수, 누적상대도수 
n<-floor(k)
num<-cut(iris$Sepal.Length,breaks=n)
freq<-table(num);freq
propfreq<-prop.table(freq);propfreq
comfreq<-cumsum(freq);cumfreq
cumpropfreq<-cumsum(propfreq);cumpropfreq
