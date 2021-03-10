m<-matrix(c(1, 5, 0, 2, 5, 3, 4, 5, 2, 4,3, 0, 6, 7, 3, 6, 7, 7, 3, 5 ),4,5);m
t(m)
r1=m[1,,drop=F];r1
c3=m[,3,drop=F];c3
c4=cbind(m[,2],m[,4]);c4
m1=matrix(c(m[1,2:5]),2,2);m1
apply(m,1,mean)
apply(m,2,mean)
