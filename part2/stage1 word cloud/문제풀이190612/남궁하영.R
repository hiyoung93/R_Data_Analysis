library(KoNLP)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(dplyr)
library(ggplot2)
getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/문제풀이190612")
useNIADic()


h <- readLines('hiphop.txt')#불러오기
#특수문자 제거
h <- unlist(h)
h <- str_replace_all(h,"[^[:alpha:]]"," ")#특수문자 지우기
h <- gsub('\\d+',' ',h)

#두자 이상만 추출
hN <- unlist(h)
h2 <- Filter(function(x) { nchar(x)>=2}, hN )#이건 돌리면 돌릴수록 계속 작아짐 
h <- gsub('\\d+','',h2)
##지우기
txt <- readLines("hhrm.txt")
i <- 1
for(i in 1:length(txt)){
  h <- gsub((txt[i]),' ',h)
}
head(sort(h2, decreasing=T),30)

#명사추출
h <- sapply(h2,extractNoun,USE.NAMES = F)
hN <- unlist(h)
head(sort(hN, decreasing=T),30)#명사로 나오지만 깔끔하지는 않음

#그림그리기
set.seed(1234)
write(unlist(hN), 'hN.txt') 
h2T <- read.table('hN.txt')
nrow(h2T)

palete <- brewer.pal(8, "Dark2")
wordcloud(names(hN), freq=hN, scale = c(5,0.3), rot.per =0.25, min.freq = 3,
          random.color = T, random.order = F, colors=palete)




# 
# #영어에 있는 전치사(불용어)지우기
# 
# stopwords('en')
# stopwords('dutch')
# sword2 <- c(stopwords('en'),stopwords('dutch'),'and','but','not','or')
# heng <- grep(h,removeWords,sword2)
# 
# 
# palete <- brewer.pal(9,'Set1')
# wordcloud(names(h), freq=h,scale=c(3,0),rot.per = 0.25,min.freq = 2,
#           random.order = F, random.color = T,colors=palete)
# 


wordcloud(words = df_word$word,  # 단어
          freq = df_word$freq,   # 빈도
          min.freq = 2,          # 최소 단어 빈도
          max.words = 200,       # 표현 단어 수
          random.order = F,      # 고빈도 단어 중앙 배치
          rot.per = .1,          # 회전 단어 비율
          scale = c(3, 0.1),     # 단어 크기 범위
          colors = palete)          # 색깔 목록

head(sort(df_word, decreasing=T),30)
