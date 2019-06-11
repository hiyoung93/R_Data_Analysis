library(KoNLP)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()

mergeUserDic(data.frame(readLines('제주도여행지.txt'),'ncn'))
txt <- readLines('jeju.txt')
place <- sapply(txt,extractNoun,USE.NAMES = F);place
head(unlist(place),30)
cdata <- unlist(place)
place <- str_replace_all(cdata,'[^[:alpha:]]',"")
place <- gsub(' ','',place)
txt <- readLines('제주도여행코스gsub.txt')
txt
for(i in 1:length(txt)){
  place <- gsub(txt[i],'',place)
}
place
place <- Filter(function(x){nchar(x)>=2},place)
write(unlist(place),'jeju_2.txt')
rev <- read.table('jeju_2.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing = T),30)
top10 <-  head(sort(wordcount, decreasing=T),10)
pie(top10,main='제주도 추천 여행코스 TOP10')
plot.new()
