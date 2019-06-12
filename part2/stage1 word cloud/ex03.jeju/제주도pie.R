getwd()
setwd( "D:/workspace/R_Data_Analysis/part2/stage1 word cloud/ex03.jeju")

install.packages('tidyverse')
install.packages('showtext')
install.packages("extrafont")
install.packages('plotrix')
library(plotrix)
library(extrafont) 
library(KoNLP)
library(rJava)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(showtext)

font_import() 
font_add_google("Nanum Gothic", "nanumgothic")
cairo_pdf("Rplot_font_adjust.pdf", family= "Nanumgothic")

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

#파스텔계열 pie
pie(top10,main='제주도 추천 여행코스 TOP10')
#rainbow계열 Pie
pie(top10,col=rainbow(10),radius=1,main='제주도 추천 여행코스 TOP10')
#수치값을 함께 출력
pct <- round(top10/sum(top10)*100,1)
names(top10)
lab <- paste(names(top10),'\n',pct,'%',sep='')
palete <- brewer.pal(8,'Dark2')
pie(top10,main='제주도 추천 여행코스 TOP10',col=palete,cex=0.8,labels=lab)

#ggplot으로 바꾸는연습을 해보자~
str(top10)
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='',y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity')

ggplot(df_top10, aes(x='',y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity')+
  coord_polar('y',start=0)

#df_top10
# 이 포스터?안에 전체적으로 영향을 준다 options(digits = 2)
options(digits = 2)
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100)
df_top10
#lable 만들기
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100)%>%
  mutate(ylabel = paste(sprintf('%4.1f', pct), '%', sep=''))
df_top10
#lable 작업한거 가지고 놀아보기
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100)%>%
  mutate(ylabel = paste(pct), '%', sep='')
df_top10#무섭게 변함

#순서 뒤집어주기
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100)%>%
  mutate(ylabel = paste(sprintf('%4.1f',rev, pct), '%', sep=''))%>%
  arrange(desc(rev)) %>%
  mutate(ypos=cumsum(pct) - 0.5*pct)
df_top10


#가운데에 자료 넣기
ggplot(df_top10, aes(x='',y=Freq, fill=rev)) +
  geom_bar(width=1,stat='identity')+
  coord_polar('y',start=0) + 
  ggtitle('제주도 여행 코스 TOP10') + 
  title(ylab = "Frequency", family = "gochi", cex.lab = 2) 
  geom_text(aes(y=ypos, label=ylabel), color = 'black')


#bar형태의 그래프로 표시하기- barplot(출력할 값,여러 옵션들)
bchart <- head(sort(wordcount,decreasing = T),10);bchart
bp <- barplot(bchart,main='제주도 추천 여행코스 TOP10',col=rainbow(10),
              cex.names=0.7,las=2,ylim=c(0,25), family= "Nanumgothic")
pct <- round(bchart/sum(bchart)*100,1);pct
text(x=bp,y=bchart*1.05,labels = paste('(',pct,'%',')'),col='black',cex=0.7,family= "Nanumgothic")
text(x=bp,y=bchart*0.95,labels = paste(bchart,'건'),col='black',cex=0.7,family= "Nanumgothic")

#옆으로 누운 바 그래프 그리기
barplot(bchart,main='제주도 추천 여행코스 TOP10',col=rainbow(10),
        xlim=c(0,25),cex.name=0.7,las=1,horiz=T)
text(x=bp,y=bchart*0.9,labels = paste(bchart,'건'),col='black',cex=0.7)
text(x=bp,y=bchart*1.15,labels = paste('(',pct,'%',')'),col='black',cex=0.7)
  


plot.new()
#3D그래프
th_pct <- round(bchart/sum(bchart)*100,1)
th_names <- names(bchart)
th_labels <- paste(th_names,'\n','(',th_pct,')')
pie3D(bchart,main='제주도 추천 여행 코스 Top10',col=rainbow(10),
      cex=0.3, labels=th_labels,explode=0.05)

