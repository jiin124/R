data<-read.csv("data/HouseData.csv")
data
dim(data)
summary(data)
str(data)

mean1<-mean(data$price);mean1
mean2<-mean(data$lotSize);mean2
mean3<-mean(data$age);mean3
mean4<-mean(data$landValue);mean4
mean5<-mean(data$livingArea);mean5
mean6<-mean(data$pctCollege);mean6
mean7<-mean(data$bedrooms);mean7
mean8<-mean(data$fireplaces);mean8
mean9<-mean(data$bathrooms);mean9
mean10<-mean(data$rooms);mean10


#heating종류,개수 확인
h1<-nrow(data[data$heating=='electric',]);h1
h2<-nrow(data[data$heating=='hot air',]);h2
h3<-nrow(data[data$heating=='hot water/steam',]);h3
#막대그래프 그리기
x1<-c(h1,h2,h3)
label1<-c("electric",'hot air','hot water/steam')
barplot(x1,horiz=T,width=50,
        xlim=c(0,1500),
        col=rainbow(length(x1)),
        xlab="개수",ylab="종류",
        names.arg=label1,
        main="heating")



#fuel종류,개수 확인
f1<-nrow(data[data$fuel=='electric',]);f1
f2<-nrow(data[data$fuel=='gas',]);f2
f3<-nrow(data[data$fuel=='oil',]);f3
x2<-c(f1,f2,f3)
label2<-c("electric",'gas','oil')
barplot(x2,horiz=T,width=50,
        xlim=c(0,1500),
        col=rainbow(length(x2)),
        xlab="개수",ylab="종류",
        names.arg=label2,
        main="fuel")


#sewer 종류,개수 확인
s1<-nrow(data[data$sewer=='septic',]);s1
s2<-nrow(data[data$sewer=='public/commercial',]);s2
s3<-nrow(data[data$sewer=='none',]);s3
x3<-c(s1,s2,s3)
label3<-c("septic","public/commercial","none")
barplot(x3,horiz=T,width=50,
        xlim=c(0,1500),
        col=rainbow(length(x3)),
        xlab="개수",ylab="종류",
        names.arg=label3,
        main="sewer")



#waterfront 종류,개수확인
w1<-nrow(data[data$waterfront=='Yes',]);w1
w2<-nrow(data[data$waterfront=='No',]);w2
x4<-c(w1,w2)
label4<-c("Yes","No")
barplot(x4,horiz=T,width=50,
        xlim=c(0,1800),
        col=rainbow(length(x4)),
        xlab="개수",ylab="종류",
        names.arg=label4,
        main="waterfront")


#newConstruction 종류, 개수확인
n1<-nrow(data[data$newConstruction=='Yes',]);n1
n2<-nrow(data[data$newConstruction=='No',]);n2
x5<-c(n1,n2)
label5<-c("Yes","No")
barplot(x5,horiz=T,width=50,
        xlim=c(0,1800),
        col=rainbow(length(x5)),
        xlab="개수",ylab="종류",
        names.arg=label5,
        main="newConstruction ")

#centralAir 종류,개수확인
c1<-nrow(data[data$centralAir=='Yes',]);c1
c2<-nrow(data[data$centralAir=='No',]);c2
x6<-c(c1,c2)
label6<-c("Yes","No")
barplot(x6,horiz=T,width=50,
        xlim=c(0,1200),
        col=rainbow(length(x5)),
        xlab="개수",ylab="종류",
        names.arg=label6,
        main="centralAir ")

#중앙값
median(data$price,na.rm=T)
median(data$lotSize,na.rm=T)
median(data$age,na.rm=T)
median(data$landValue,na.rm=T)
median(data$livingArea,na.rm=T)
median(data$pctCollege,na.rm=T)
median(data$bedrooms,na.rm=T)
median(data$fireplaces,na.rm=T)
median(data$bathrooms,na.rm=T)
median(data$rooms,na.rm=T)

#최빈값

#범위
range(data$price,na.rm=T)
range(data$lotSize,na.rm=T)
range(data$age,na.rm=T)
range(data$landValue,na.rm=T)
range(data$livingArea,na.rm=T)
range(data$pctCollege,na.rm=T)
range(data$bedrooms,na.rm=T)
range(data$fireplaces,na.rm=T)
range(data$bathrooms,na.rm=T)
range(data$rooms,na.rm=T)

#히스토그램
hist(data$price,breaks=seq(5000,775000,by=110000),right=F,main="price의 히스토그램",xlab="범위",ylab="개수",col="pink")
hist(data$lotSize,breaks=seq(0,13,by=1),right=F,main="lotSize의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$age,breaks=seq(0,225,by=25),right=F,main="age의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$landValue,breaks=seq(200,420200,by=70000),right=F,main="landValue의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$livingArea,breaks=seq(500,5500,by=500),right=F,main="livingArea의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$pctCollege,breaks=seq(20,90,by=10),right=F,main="pctCollege의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$bedrooms,breaks=seq(1,7,by=1),right=F,main="bedrooms의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$fireplaces,breaks=seq(0,4,by=1),right=F,main="fireplaces의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$bathrooms,breaks=seq(0,5,by=1),right=F,main="bathrooms의 히스토그램",xlab="범위",ylab="개수",col="purple")
hist(data$rooms,breaks=seq(2,12,by=2),right=F,main="rooms의 히스토그램",xlab="범위",ylab="개수",col="purple")

#상자그림
boxplot(data$price,main="price",col="green")
boxplot(data$lotSize,main="lotSize",col="green")
boxplot(data$age,main="age",col="green")
boxplot(data$landValue,main="landValue",col="green")
boxplot(data$livingArea,main="livingArea",col="green")
boxplot(data$pctCollege,main="pctCollege",col="green")
boxplot(data$bedrooms,main="bedrooms",col="green")
boxplot(data$fireplaces,main="fireplaces",col="green")
boxplot(data$bathrooms,main="bathrooms",col="green")
boxplot(data$rooms,main="rooms",col="green")


#난방 종류에 따른 평균 집가격 확인
tmp1<-tapply(data$price,data$heating,mean,na.rm=T)
tmp1
barplot(tmp1,main="난방 종류에 따른 평균 집가격 확인")

#난방 연료 종류에 따른 평균 집가격 확인
tmp2<-tapply(data$price,data$fuel,mean,na.rm=T)
tmp2
barplot(tmp2,main="난방 연료 종류에 따른 평균 집가격 확인")

#하수구 종류에 따른 평균 집가격 확인
tmp3<-tapply(data$price,data$sewer,mean,na.rm=T)
tmp3
barplot(tmp3,main="하수구 종류에 따른 평균 집가격 확인")

#물가 유무에 따른 평균 집가격 확인
tmp4<-tapply(data$price,data$waterfront,mean,na.rm=T)
tmp4
barplot(tmp4,main="물가 유무에 따른 평균 집가격 확인")

#집이 신축인지에 따른 평균 집가격 확인
tmp5<-tapply(data$price,data$newConstruction,mean,na.rm=T)
tmp5
barplot(tmp5,main="집이 신축인지에 따른 평균 집가격 확인")

#에어컨 유무에 따른 집가격 확인
tmp6<-tapply(data$price,data$centralAir,mean,na.rm=T)
tmp6
barplot(tmp6,main="에어컨 유무에 따른 집가격 확인")

#상관관계 

#주택가격과 로트 크기의 관계
plot(data$price,data$lotSize,main="주택가격과 로트의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="lotSize")
points(data$price,data$lotSize,cex=.2,col='dark blue')
f1=lm(data$lotSize~data$price)
abline(f1,col="red")
summary(f1)
cor(data$price,data$lotSize)

#주택가격과 주택나이  관계
plot(data$price,data$age,main="주택가격과 주택나이의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="age")
points(data$price,data$age,cex=.2,col='dark blue')
f2=lm(data$age~data$price)
abline(f2,col="red")
summary(f2)
cor(data$price,data$age)

#주택가격과 토지가치의 관계
plot(data$price,data$landValue,main="주택가격과 토지가치의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="landvalue")
points(data$price,data$landValue,cex=.2,col='dark blue')
f3=lm(data$landValue~data$price)
abline(f3,col="red")
summary(f3)
cor(data$price,data$landValue)

#주택가격과 생활공간넓이의 관계
plot(data$price,data$livingArea,main="주택가격과 생활공간넓이의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="livingArea")
points(data$price,data$livingArea,cex=.2,col='dark blue')
f4=lm(data$livingArea~data$price)
abline(f4,col="red")
summary(f4)
cor(data$price,data$livingArea)


#주택가격과 대학을 졸업한 이웃의 비율 관계
plot(data$price,data$pctCollege,main="주택가격과 대학을 졸업한 이웃의 비율 관계",
     data=data,pch=22,las=1,xlab="price",ylab="pctCollege")
points(data$price,data$pctCollege,cex=.2,col='dark blue')
f5=lm(data$pctCollege~data$price)
abline(f5,col="red")
summary(f5)
cor(data$price,data$pctCollege)

#주택가격과 침실수 관계
plot(data$price,data$bedrooms,main="주택가격과 대학을 졸업한 이웃의 비율 관계",
     data=data,pch=22,las=1,xlab="price",ylab="bedrooms")
points(data$price,data$bedrooms,cex=.2,col='dark blue')
f6=lm(data$bedrooms~data$price)
abline(f6,col="red")
summary(f6)
cor(data$price,data$bedrooms)

#주택가격과 벽난로 개수의 관계
plot(data$price,data$fireplaces,main="주택가격과 벽난로 개수의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="fireplaces")
points(data$price,data$fireplaces,cex=.2,col='dark blue')
f7=lm(data$fireplaces~data$price)
abline(f7,col="red")
summary(f7)
cor(data$price,data$fireplaces)

#주택가격과 욕실 개수의 관계
plot(data$price,data$bathrooms,main="주택가격과 욕실 개수의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="bathrooms")
points(data$price,data$bathrooms,cex=.2,col='dark blue')
f8=lm(data$bathrooms~data$price)
abline(f8,col="red")
summary(f8)
cor(data$price,data$bathrooms)

#주택가격과 객실수의 관계
plot(data$price,data$rooms,main="주택가격과 객실수의 관계",
     data=data,pch=22,las=1,xlab="price",ylab="rooms")
points(data$price,data$rooms,cex=.2,col='dark blue')
f9=lm(data$rooms~data$price)
abline(f9,col="red")
summary(f9)
cor(data$price,data$rooms)

#상관관계 그래프프
library(corrplot)
data1 <- data[,c(1:10)]
cor(data1)
corrplot(cor(data1),method="shade",
         addshade="all",addCoef.col="black")

#분산분석
#Pr(p-value)이 값이 0.05보다 작으면 통계적으로 유의미한 차이가 있다
#0.05 이하면 귀무가설을 채택, 등분산성을 만족하는 것으로 판단하고 분산분석을 실시

summary(aov(data$price~data$lotSize))
#0.05보다 작음
summary(aov(data$price~data$age))
#0.05보다 작음
summary(aov(data$price~data$landValue))
#0.05보다 작음
summary(aov(data$price~data$livingArea))
#0.05보다 작음
summary(aov(data$price~data$pctCollege))
#0.05보다 작음
summary(aov(data$price~data$bedrooms))
#0.05보다 작음
summary(aov(data$price~data$fireplaces))
#0.05보다 작음
summary(aov(data$price~data$bathrooms))
#0.05보다 작음
summary(aov(data$price~data$rooms))
#0.05보다 작음
summary(aov(data$price~data$heating))
#0.05보다 작음
summary(aov(data$price~data$fuel))
#0.05보다 작음
summary(aov(data$price~data$sewer))
#0.05보다 작음
summary(aov(data$price~data$waterfront))
#0.05보다 작음
summary(aov(data$price~data$newConstruction))
#0.05보다 작음
summary(aov(data$price~data$centralAir))
#0.05보다 작음

t<-rnorm(1000,mean=mean(data$price),sd=sd(data$price))
t1<-rnorm(1000,mean=mean(data$lotSize),sd=sd(data$lotSize))
t2<-rnorm(1000,mean=mean(data$age),sd=sd(data$age))
t3<-rnorm(1000,mean=mean(data$landValue),sd=sd(data$landValue))
t4<-rnorm(1000,mean=mean(data$livingArea),sd=sd(data$livingArea))
t5<-rnorm(50,mean=mean(data$pctCollege),sd=sd(data$pctCollege))
t6<-rnorm(7,mean=mean(data$bedrooms),sd=sd(data$bedrooms))
t7<-rnorm(4,mean=mean(data$fireplaces),sd=sd(data$fireplaces))
t8<-rnorm(5,mean=mean(data$bathrooms),sd=sd(data$bathrooms))
t9<-rnorm(10,mean=mean(data$rooms),sd=sd(data$rooms))


var.test(x=t,y=t1)
#이때 p-value가 0.05보다 작다면 두 집단이 비슷한 집단이라는 소리
t.test(x=t,y=t1,var.equal=F)


var.test(t,t2)
t.test(t,t2,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t3)
t.test(t,t3,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t4)
t.test(t,t4,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t5)

t.test(t,t5,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t6)
t.test(t,t6,var.equal=F)


var.test(t,t7)
t.test(t,t7,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t8)
t.test(t,t8,var.equal=F)
#0.05작으면 통계적으로 유의함

var.test(t,t9)
t.test(t,t9,var.equal=F)
#0.05작으면 통계적으로 유의함

#다중회귀분석
model_1=lm(price~lotSize+age+landValue+
                   livingArea+pctCollege+bedrooms+fireplaces+
                   bathrooms+rooms,data=data)
summary(model_1)
#유의하지 않은 값은 pctCollage,fireplaces이다.

#유의하지 않은 값 제외하고 다시 모델 만들기
model_2=lm(price~lotSize+age+landValue+livingArea+bedrooms+bathrooms+rooms,data=data)
summary(model_2)

anova(model_1,model_2)
#p_value가 0.4727로 크진 않음..앞서 제거된 두 값이 회귀모형에 기여도가 작다고
#말할수 있을까?

summary(model_2)
#R^2값이 0.6269 -> 최종 회귀 모형이 예측 변수들의 62.69%를 설명함

plot(model_2)






