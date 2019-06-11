setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud")


library(KoNLP)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(RColorBrewer)
useSejongDic()



data1 <- readLines('remake.txt'); data1
data2 <- sapply(data1,extractNoun,USE.NAMES = F); data2
data3 <- unlist(data2)
data3 <- Filter(function(x){nchar(x)<=10},data3)
#글자의 chr수가 10이하만 넣을게
head(unlist(data3),30)
data3 <- gsub('\\d+','',data3)
data3 <- gsub('쌍수','쌍꺼풀',data3)
data3 <- gsub('쌍커풀','쌍꺼풀',data3)
data3 <- gsub('메부리코','매부리코',data3)
data3 <- gsub(' ','',data3)
data3 <- gsub("\\'",'',data3)
data3 <- gsub("수",'',data3)
data3 <- gsub(".'",'',data3)
data3

write(unlist(data3),'remake_2.txt')
data4 <- read.table('remake_2.txt');data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T),20)
txt <- readLines('성형gsub.txt');txt

for(i in 1:length(txt)){
  data3 <- gsub((txt[i]),'',data3)
}
write(unlist(data3),'remake_2.txt')
data4 <- read.table('remake_2.txt');data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount,decreasing = T),30)

palete <- brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per = 0.25,min.freq = 2,
          random.order = F,random.color = T,colors = palete)
legend(0.3,1,'여고생들이 선호하는 성형수술 부위',cex=1,fill=NA,border=NA,bg='white',
       text.col='red',text.font=2,box.col='red')

