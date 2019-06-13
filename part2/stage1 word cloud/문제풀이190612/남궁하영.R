#패키지불러오기
library(KoNLP)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(dplyr)
library(ggplot2)
library(extrafont)

#폰트설정
library(extrafont) 
library(tidyverse) # 구글
library(showtext) # 구글
font_add_google('Nanum Myeongjo','font')

font_add('nanum','NanumMyeongjo.ttf')
font_import(pattern = "D2")
font_import(pattern = "Nanum")
#window 내장 폰트
windowsFonts()
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))



#사전불러오기
useSejongDic()
useNIADic()
#색지정 
palete <- brewer.pal(8, "Dark2")

#파일저장위치
getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/문제풀이190612")

#불러오기
h <- readLines('hiphop.txt')

#특수문자 제거
h <- unlist(h)
h <- str_replace_all(h,"[^[:alpha:]]"," ")#특수문자 지우기
# h <- str_replace_all(h,"[^[a-zA-Z]]"," ")#알파벳만 있는거 지우기
h <- gsub('\\d+','',h)
h<- gsub('[ㄱ-ㅎ]','',h)
h<- gsub('[~!@#$%&*()_+=?<>]','',h)
h<- gsub('[a-zA-Z]','',h)
head(h)

#명사추출
hN <- sapply(h,extractNoun,USE.NAMES = F)
hN <- unlist(hN)
head(h)

#두자 이상만 추출
h2 <- Filter(function(x) { nchar(x)>=2}, hN )#이건 돌리면 돌릴수록 계속 작아짐 
head(h2, decreasing=T,100)

#조건문으로 지우기
txt <- readLines("hhrm.txt")
i <- 1
for(i in 1:length(txt)){
  h <- gsub((txt[i]),' ',h2)
}

head(h2, decreasing=T,100)

#잘안지워진거 하나씩 지우기
h <- gsub('빠삐','',h2)
h <- gsub('모르겠','',h)
h <- gsub('이러','',h)
h <- gsub('시시','',h)
h <- gsub('닳도','',h)
h <- gsub('좋았','',h)
h <- gsub('싫증','',h)
h <- gsub('마르','',h)

head(h, decreasing=T,100)


#그림그리기
set.seed(1234)
write(unlist(h), 'hN.txt') 
h <- read.table('hN.txt')

h1<- unlist(h)
# nrow로 값을 확인하고

nrow(h1)
answer <- table(h1)
head(sort(answer, decreasing=T),20)

wordcloud(names(answer), freq = answer, scale = c(5,0.1), rot.per =0.25, min.freq = 4,
          random.color = T, random.order = F, colors=palete, family="malgun")

#ggplot으로 만들자!

#####

#top10만들기

head(sort(answer, decreasing=T),10)

top10 <-  head(sort(answer, decreasing=T),10)


#data frame으로 만들기(세로로 만들기) 
df_top10 <- as.data.frame(top10)
df_top10

#백분율로 계산(__%)
options(digits = 2)
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  mutate(ylabel = paste(sprintf("%s\n%4.1f", h1, pct), '%', sep='')) %>%
  arrange(desc(h1)) %>%
  mutate(ypos = cumsum(pct) - 0.5*pct)
df_top10


#전체합쳐져있는 그래프
ggplot(df_top10, aes(x='', y=Freq, fill=h1)) +
  geom_bar(width=1, stat='identity')

#원그래프

ggplot(df_top10, aes(x='', y=pct, fill=h1)) +
  geom_bar(aes(x=h1, y=Freq, fill=h1), stat='identity',position=position_dodge(width=1)) +
  geom_text(aes(x=h1, y=Freq,label=pct, group=h1), position=position_dodge(width=1), size=4) +
  coord_polar("x", start = 0)+
  ggtitle("hiphop 단어 빈도수 TOP10")+
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"))


####단어가 뭉쳐져서 풀어주기
# y축의 값의 설정을 잘못함 ;
 

#bargarph
g <- ggplot(df_top10, aes(x=h1, y=Freq, fill=h1)) +
  geom_bar(aes(x=h1, y=Freq, fill=h1), stat='identity',position=position_dodge(width=1)) +
  geom_text(aes(x=h1, y=Freq,label=ylabel, group=h1), position=position_dodge(width=1), size=4)+
  ggtitle("hiphop 단어 빈도수 TOP10")+
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue"));g

#제목넣기 (title)
g+ggtitle("hiphop 단어 빈도수 TOP10")+
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                size = 15, color = "darkblue"))

