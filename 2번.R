library(MASS)


#줄기-잎 그림
x<-trees["Girth"]
x<-unlist(x,use.name=F)
stem(x)

y<-trees['Volume']
y<-unlist(y,use.name=F)
stem(y)

z<-trees['Height']
z<-unlist(z,use.name=F)
stem(z)

#상자그림

boxplot(x,horizontal=TRUE,main="Girth",col="skyblue")
boxplot(y,horizontal=TRUE,main="Volume",col="skyblue")
boxplot(z,horizontal=TRUE,main="Height",col="skyblue")

#히스토그램
hist(trees$Height,breaks=seq(60,90,by=5),right=F,main="Trees Height",
     xlab="Height",ylab="나무의 개수",col="pink")
hist(trees$Girth,breaks=seq(5,25,by=5),right=F,main="Trees Girth",
     xlab="Girth",ylab="나무의 개수",col="pink")
hist(trees$Volume,breaks=seq(5,80,by=8),right=F,main="Trees Volumns",
     xlab="Volume",ylab="나무의 개수",col="pink")
