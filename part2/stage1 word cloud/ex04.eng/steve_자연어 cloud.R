setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/ex04.eng")
getwd()
install.packages('tm')
library(tm)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(stringr)

data1 <- readLines('steve.txt'); data1
class(data1)
corp1 <- Corpus(VectorSource(data1));corp1
inspect(corp1)

tdm <- TermDocumentMatrix(corp1);tdm
m <- as.matrix(tdm);m

stopwords('en')
stopwords('dutch')

corp2 <- tm_map(corp1,stripWhitespace)
corp2 <- tm_map(corp1,removeNumbers)
corp2 <- tm_map(corp1,removePunctuation)
corp2 <- tm_map(corp1,PlainTextDocument)
sword2 <- c(stopwords('en'),'and','but','not')
corp2 <- tm_map(corp1,removeWords,sword2)
corp2


tdm2 <- TermDocumentMatrix(corp2); tdm2

m2 <- as.matrix(tdm2);m2
class(m2)
colnames(m2) <- c(1:4);m2
freq1 <- sort(rowSums(m2),decreasing = T)
head(freq1,20)
freq2 <- sort(rowSums(m2),decreasing = T)
head(freq2,20)
findFreqTerms(tdm2,2)
findAssocs(tdm2,'love',0.5)
findAssocs(tdm2,'story',0.6)



palete <- brewer.pal(7,'Set3')
wordcloud(names(freq1),freq=freq1,scale=c(5,0.3),min.freq = 1,colors=palete,random.order = F,
          random.color=T)
legend(0.3,1,'seteve_talk      ',cex=1, fill=NA,border = NA,bg='white',
       text.col='red',text.font=2,box.col = 'red')
