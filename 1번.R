library(MASS)
View(Titanic)
str(Titanic)

Titanic

#childno-----------------------
childno<-Titanic[,,1,1]
childno
barplot(as.matrix(childno[,c('Male','Female')]),
        beside=T,col=rainbow(nrow(childno)),ylim=c(0,40))

legend("topright",rownames(childno),fill=rainbow(4),cex=1)
title(main="Age = Child, Survived = No",xlab="Sex&Class",ylab="died")


#adultno-----------------------
adultno<-Titanic[,,2,1]
adultno

barplot(as.matrix(adultno[,c('Male','Female')]),
        beside=T,col=rainbow(nrow(adultno)),ylim=c(0,700))

legend("topright",rownames(adultno),fill=rainbow(4),cex=1)
title(main="Age = Adult, Survived = No",xlab="Sex&Class",ylab="died")

#childyes-----------------------
childyes<-Titanic[,,1,2]
childyes

barplot(as.matrix(childyes[,c('Male','Female')]),
        beside=T,col=rainbow(nrow(childyes)),ylim=c(0,30))

legend("topright",rownames(childyes),fill=rainbow(4),cex=1)
title(main="Age = Child, Survived = Yes",xlab="Sex&Class",ylab="survived")


#adultyes-----------------------
adultyes<-Titanic[,,2,2]
adultyes

barplot(as.matrix(adultyes[,c('Male','Female')]),
        beside=T,col=rainbow(nrow(adultyes)),ylim=c(0,250))

legend("topright",rownames(adultyes),fill=rainbow(4),cex=1)
title(main="Age = Adult, Survived = Yes",xlab="Sex&Class",ylab="survived")

#원형그래프----------------------------

pie(childno[,1],labels=paste(childno[,1],round(childno[,1]*100/sum(childno[,1]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(childno),fill=rainbow(4),cex=1)
pie(childno[,2],labels=paste(childno[,2],round(childno[,2]*100/sum(childno[,2]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(childno),fill=rainbow(4),cex=1)

pie(adultno[,1],labels=paste(adultno[,1],round(adultno[,1]*100/sum(adultno[,1]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(adultno),fill=rainbow(4),cex=1)
pie(adultno[,2],labels=paste(adultno[,2],round(adultno[,2]*100/sum(adultno[,2]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(adultno),fill=rainbow(4),cex=1)

pie(childyes[,1],labels=paste(childyes[,1],round(childyes[,1]*100/sum(childyes[,1]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(childyes),fill=rainbow(4),cex=1)
pie(childyes[,2],labels=paste(childyes[,2],round(childyes[,2]*100/sum(childyes[,2]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(childyes),fill=rainbow(4),cex=1)

pie(adultyes[,1],labels=paste(adultyes[,1],round(adultyes[,1]*100/sum(adultyes[,1]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(childyes),fill=rainbow(4),cex=1)
pie(adultyes[,2],labels=paste(adultyes[,2],round(adultyes[,2]*100/sum(adultyes[,2]),1),"%"),radius=2,col=rainbow(4))
legend("topright",rownames(adultyes),fill=rainbow(4),cex=1)
