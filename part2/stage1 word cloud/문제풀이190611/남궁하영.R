library(KoNLP)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()

getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/문제풀이190611")

# 파일 읽기
answer <- readLines('응답소_2015_01.txt') 
#읽은 파일 라인마다 명사단어들만 남기기
answerN <- sapply(answer, extractNoun, USE.NAMES=F);answerN 
#명사만 단어만 가지고 오기
answerL<- unlist(answerN) ;answerL
#2자 이상의 단어만 가지고 오기
answer <- Filter(function(x) {
  nchar(x)>=2
},answerL) ;answer

#필요없는거 지우기
rm <- unlist(answer)
answer <- str_replace_all(rm,"[^[:alpha:]]","")#특수문자 지우기
answer <- gsub('\\d+','',answer)#숫자지우기
answer
txt <- readLines("gsub01.txt");txt#따로 메모장에 있는 문자지우기
for(i in 1:length(txt)){
  answer <- gsub((txt[i]),'',answer)
}

answer <- unlist(answer) ;answer
head(sort(answer, decreasing=T),30)

#파일저장
write(unlist(answer), '응답하라1501') 
answerR <- read.table('응답하라1501')
nrow(answerR)
answer <- table(answerR)
head(sort(answer, decreasing=T),30)


palete <- brewer.pal(11, "Paired")
wordcloud(names(answer),freq=answer,scale = c(4,0.3),rot.per =F,min.freq = 4,
          random.color = T,random.order = T,colors=palete)

