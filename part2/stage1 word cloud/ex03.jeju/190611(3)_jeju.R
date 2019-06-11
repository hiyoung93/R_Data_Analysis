setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/ex03.jeju")
getwd()

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
# :alpha: 에서 뒤에 : 을 표시하지 않으면 전체 삭제가 된다..무서운아이
#한글,영어 외 삭제
place <- gsub(' ','',place)
txt <- readLines('제주도여행코스gsub.txt'); txt
for(i in 1:length(txt)){
  place <- gsub((txt[i]),"",place)
};
place
place <- Filter(function(x) {nchar(x)>=2},place)
write(unlist(place),'jeju_2.txt')
rev <- read.table('jeju_2.txt')
nrow(rev)
wordcount <- table(rev)
head(sort(wordcount, decreasing = T),30)

palete <- brewer.pal(9,'Set1')
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0),rot.per = 0.25,min.freq = 2,
          random.order = F, random.color = T,colors=palete)
# scale의 값에 따라 나오는 데이터의 양이 다르다다
legend(0.3,1,'제주도 추천 여행 코스 분석 ',cex=0.8,fill=NA,border=NA,bg='white',
       text.col='red',text.font=2,box.col='red')
