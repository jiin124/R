#1번
library(MASS)
update.packages()

#2번
str(iris)

#3번
View(iris)
#가독성이 좋은 dataframe을 볼 수 있다.

#4번
names(iris)
colnames(iris)

#5번
iris[,c('Sepal.Length','Petal.Length')]

#6번
apply(iris[1:4],2,sum)
apply(iris[1:4],2,mean)

#7번
colMeans(iris[,c('Sepal.Length','Petal.Length')])

#8번
iris$Species

#9번- 품종에 대한 도수, 상대도수, 상대도수의 합을 포함하는 도수분포표작성
irisfreq<-table(iris$Species);irisfreq
profreq<-prop.table(irisfreq);profreq
profreq<-round(profreq,3);profreq
table<-rbind(irisfreq,profreq);table
table<-addmargins(table,margin=2);table
