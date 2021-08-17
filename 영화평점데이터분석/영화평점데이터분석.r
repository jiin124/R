
library(rvest)
library(httr)
library(stringr)
url='https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=184517&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='
url
allReview=c()

for(page in 1:10){
  link=(page-1)*10+1
  urls=paste(url,link,sep="")
  htxt=read_html(urls)
  comments=html_nodes(htxt,'div.score_result')
  reviews=html_text(comments)
  if(length(reviews)==0){
    break
  }
  
  allReview=c(allReview,reviews)
  print(link)
}

length(allReview)
allReview

write(allReview,"영화평점수집.txt")
write.csv(allReview,"영화평점수집.csv")

library(KoNLP)
library(wordcloud)
library(RColorBrewer)

data1<-readLines("영화평점수집.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES=F)
data2
data2data3<-unlist(data2)
data3<-Filter(function(x){nchar(x)>=2},data3)
data3
write(unlist(data3),"Moviescore2.txt")
data4<-read.table("Moviescore2.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing = T),20)


data3<-unlist(data2)
movie_gsub<-str_replace_all(data3,"[^[:alpha:]]","")
gsub("\\d+","",movie_gsub)
gsub("\\.","",movie_gsub)
movie_gsub<-gsub(" ",""movie_gsub)
movie_gsub<-gsub("비공","",movie_gsub)
movie_gsub<-gsub("중간","",movie_gsub)
movie_gsub<-gsub("영화","",movie_gsub)
data4<-read.table("Moviescore2.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing=T),10)

library(KoNLP)
library(wordcloud)
library(RColorBrewer)

data1<-readLines("영화평점수집.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2

data3<-unlist(data2)
movie_gsub<-str_replace_all(data3,"[^[:alpha:]]","")
gsub("\\d+","",movie_gsub)
gsub("\\.","",movie_gsub)
movie_gsub<-gsub(" ","",movie_gsub)
movie_gsub<-gsub("비공","",movie_gsub)
movie_gsub<-gsub("중간","",movie_gsub)
movie_gsub<-gsub("영화","",movie_gsub)

movie_gsub<-Filter(function(x){nchar(x)>=2},movie_gsub)
movie_gsub
write(unlist(movie_gsub),"Moviescore2.txt")
data4<-read.table("Moviescore2.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing=T),10)

palete<-brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per = 0.25,min.freq = 1,random.order = F,random.color=T,colors=palete)


top10<-head(sort(wordcount,decreasing=T),10)
pie(top10,main="영화평점댓글 top 10")
pie(top10,col=rainbow(10),radius=1,main="영화평점댓글 top 10")

pct<-round(top10/sum(top10)*100,1)
names(top10)
lab<-paste(names(top10),"\n",pct,"%")
pie(top10,main="영화평점댓글 top 10",col=rainbow(10),cex=0.8,labels=lab)

#bar 그래프 데이터 시각화

bp<-barplot(top10,main="영화평점댓글 top 10",col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,15))
pct<-round(top10/sum(top10)*100,1)
pct
text(x=bp,y=top10*1.05,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
text(x=bp,y=top10*0.95,labels=paste(top10,"건"),col="black",cex=0.7)
