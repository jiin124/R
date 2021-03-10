oecd<-matrix(c(2.9,2.3,1.2,1.0,2.0,6.2,2.9,2.0,1.1,0.6,2.3,5.7),byrow=T,ncol=6)
colnames(oecd)<-c("세계","미국","유로존","일본","한국","중국")
rownames(oecd)<-c("2019","2020")
oecd
oecd[,5,drop=F]
4)는 무슨 개소리야
apply(oecd,1,mean)
