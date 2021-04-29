
military=read.csv("육군 신체측정 데이터(수시 업데이터).csv",header=T)
head(military,30)

summary(military)#데이터들이 문자열로 저장되어있는 것을 알 수 있다.

#문자열을 숫자형으로 바꾸어준다.
military$가슴.둘레.센티미터<-as.numeric(military$가슴.둘레.센티미터)
military$소매길이.센티미터<-as.numeric(military$소매길이.센티미터)
military$신장.센티미터<-as.numeric(military$신장.센티미터)
military$허리.둘레.센티미터<-as.numeric(military$허리.둘레.센티미터)
military$샅높이.센티미터<-as.numeric(military$샅높이.센티미터)
military$머리.둘레.센티미터<-as.numeric(military$머리.둘레.센티미터)
military$발.길이.센티미터<-as.numeric(military$발.길이.센티미터)
military$몸무게.킬로그램<-as.numeric(military$몸무게.킬로그램)

summary(military)

#키 히스토그램
hist(military$신장.센티미터,breaks=seq(150,210,by=5),right=F,main="신장",
     xlab="신장",ylab="명",col="grey")


#몸무게 히스토그램
hist(military$몸무게.킬로그램,breaks=seq(40,140,by=10),right=F,main="몸무게",
     xlab="몸무게",ylab="명",col="grey")

#가슴둘레 히스토그램
hist(military$가슴.둘레.센티미터,breaks=seq(70,140,by=10),right=F,main="가슴둘레",
     xlab="가슴",ylab="명",col="grey")

#소매길이 히스토그램
hist(military$소매길이.센티미터,breaks=seq(70,100,by=3),right=F,main="소매길이",
     xlab="소매길이",ylab="명",col="grey")

#허리둘레 히스토그램
hist(military$허리.둘레.센티미터,breaks=seq(40,160,by=10),right=F,main="허리둘레",
     xlab="허리둘레",ylab="명",col="grey")

#샅높이 히스토그램
hist(military$샅높이.센티미터,breaks=seq(5,110,by=5),right=F,main="샅높이",
     xlab="샅높이",ylab="명",col="grey")
#샅높이 summary 최솟값에 5와 가까운 값이 있는데 이 값은 오류값임을 알 수 있다.

#머리둘레 히스토그램
hist(military$머리.둘레.센티미터,breaks=seq(50,70,by=5),right=F,main="머리둘레",
     xlab="머리둘레",ylab="명",col="grey")

#발길이 히스토그램
hist(military$발.길이.센티미터,breaks=seq(15,40,by=5),right=F,main="발길이",
     xlab="발길이",ylab="명",col="grey")

plot(military$신장.센티미터,military$몸무게.킬로그램,data=military,pch=22,las=1,
     xlab="키",ylab="몸무게")
points(military$신장.센티미터,military$몸무게.킬로그램,cex=.2,col="dark blue")
f=lm(military$몸무게.킬로그램~military$신장.센티미터)
abline(f,col="red")
summary(f)
#통계량에 따라서 키가 클수록 몸무게가 높게 나간다는 결론을 데이터를 통해
#확실하게 알 수 있다.


dayheight<-military[c('측정.일자','신장.센티미터')]
dayheight
library(ggplot2)
ggplot(data=dayheight,aes(x=측정.일자,y=신장.센티미터))+geom_line()+geom_point()

