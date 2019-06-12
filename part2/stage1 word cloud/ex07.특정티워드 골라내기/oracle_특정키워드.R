getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/ex07.특정티워드 골라내기")
library(KoNLP)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(stringr)
useSejongDic()

alert <- readLines('oracle_alert_testdb.log')
head(alert,10)
error_1 <- gsub(' ','_',alert) 
head(unlist(errot_1),20)
error_2 <- unlist(error_1)
error_2 <- Filter(function(x){nchar(x)>=5},error_2)

error_3 <- grep("^ORA-+",error_2,value = T)
head(unlist(error_3),20)
write(unlist(error_3),'alest_testdb2.log')
rev <- read.table('alest_testdb2.log')
nrow(rev)
errorcount <- table(rev)
head(sort(errorcount, decreasing = T),20)

palete <- brewer.pal(9,'Set1')
wordcloud(names(errorcount),freq=errorcount,scale=c(5,0.5),rot.per=0.25,min.freq=3,
          random.order=F,random.color=T,color=palete)
legend(0.3,1,'Oracle Alert Log File 분석결과   ',cex=0.8,fill=NA,border = NA,
       bg='white', text.col = 'darkgreen',text.font = 2,box.col = 'darkblue')
