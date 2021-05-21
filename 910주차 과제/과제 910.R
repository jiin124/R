#1
(x1=1/3*1/5)
(x2=1/3*2/5)
(x3=1/3*3/5)
library(MASS)
as.fractions(x1+x2+x3)

#2
#2-1
x20=0.15*0.58
x30=0.24*0.52
x40=0.26*0.04
x50=0.2*0.4
x60=0.15*0.35

S<-x20+x30+x40+x50+x60
as.fractions(x20+x30+x40+x50+x60)


#2-2
S-x20
S-x30
S-x40
S-x50
S-x60

#3
library(prob)
S<-rolldie(3)
Hcount<-function(x) sum(x=='1')
X<-apply(S,1,Hcount);X
(freq<-table(X))
(prob<-freq/length(X))
library(MASS)
as.fractions(prob)

plot(prob,main="주사위 3개를 던졌을 때, 1의 눈이 관촬된 횟수에 대한 확률분포",
     xlab="1의 개수",ylab="상대도수",type="h",col="Pink",ylim=c(0,max(prob)+0.01),lwd=4)

#3
f1<-function(x){9-x^2}
(c1<-integrate(f1,0,3))

library(MASS)
as.fractions(1/18)

pdf<-function(x){(1/18)*(9-x^2)}
(integrate(pdf,2,3))

#4
f1<-function(x){9-x^2}
(c1<-integrate(f1,-3,3))
library(MASS)
as.fractions(1/36)
pdf<-function(x){(1/36)*(9-x^2)}
(integrate(pdf,2,3))

#5
#5-1

library(prob)
S<-rolldie(2);S
Hcount<-function(x){sum(x)}
X<-apply(S,1,Hcount)
(freq<-table(X))
(prob<-freq/length(X))
as.fractions(prob)

#5-2

S1<-rolldie(2);S1
X1<-abs(S1$X1-S1$X2);X1
(freq1<-table(X1))
(prob1<-freq/length(X1))
as.fractions(prob1)

#5-3
as.fraction(prob*prob1)




