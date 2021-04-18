#문제1
work<-c(42.4,49.4,49.9,45.9,51.4,54.3,49.1,53.4,46.8,50.4,52.4,48.3,56.5,47.0,46.3,54.2,53.8,44.1,54.9,43.7)
work
hist(work,breaks=seq(40,58,seq=3),right=F,main="주당 평균 근로시간"
     ,xlab="시간",ylab="명",col="pink")

#문제2

ABO<-c("A","B","B" ,"A", "A", "O", "A", "AB", "O", "O", "A", "B", "O", "AB", "B",
       "B", "A", "O", "B", "A", "B", "B", "O", "AB", "B","A", "AB", "A", "B", "A",
       "O", "A", "A", "B", "AB", "A", "O", "B", "A", "B", "B", "A", "B", "A", "B",
       "AB", "B", "A", "O", "AB", "O", "B", "A", "B", "A", "O", "B", "A", "A", 'A')
x<-table(ABO);x
pie(x,main="혈액형",col=rainbow(length(x)),
    paste(round(x/sum(x)*100),'%'),radius=1.2)
pie(x)


#문제3
y<-c(12, 15, 16, 21, 24, 29, 30, 31, 32, 33,
     45, 46, 49, 50, 52, 58, 60, 63, 64, 65)
stem(y,scale=2)
