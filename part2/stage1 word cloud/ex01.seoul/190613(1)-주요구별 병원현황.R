setwd('D:/workspace/R_Data_Analysis/part2/stage1 word cloud/ex01.seoul')
getwd()
library(ggplot2)
library(dplyr)

#폰트 설치..
# 너무 하고 싶은 폰트를 그냥 아싸리 R_studio_font안에 넣었다,..
# windowsFonts()안에 알아서 나온다 ㅜㅜ 눙물물
library(extrafont)
windowsFonts()

#데이터 꺼내기
data <- read.csv('2013년_서울_주요구별_병원현황.csv');data

str(data)#int로 만들어서 구별 병원수 나열


#병원수 평균
a1 <- mean(data[1:9,2])#강남구 병원수 평균
a2 <- mean(data[1:9,3])#강동구 
a3 <- mean(data[1:9,4])##강서구
a4 <- mean(data[1:9,5])#관악구
a5 <- mean(data[1:9,6])#구로구
a6 <- mean(data[1:9,7])#도봉구
a7 <- mean(data[1:9,8])#동대문구
a8 <- mean(data[1:9,9])#동작구
a9 <- mean(data[1:9,10])#마포구
a10 <- mean(data[1:9,11])#서대문구

#############강남구 병원 수
ggplot(data,aes(x=표시과목,y=강남구,fill=표시과목))+ 
  geom_bar(stat='identity')+
  geom_text(aes(x=표시과목, y=강남구,label=v1*10, group=표시과목,family = 'NanumGothic'))+ #familly는 데이터안에 들어가는 글씨
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8,family = 'NanumGothic')) +  #angle-제목 기울기,familly-x.y축글씨
  ggtitle('강남구 병원 수') +
  theme(plot.title = element_text(face = "bold", hjust = 0.7, vjust=1, #hjust-제목좌우위치,vjust-제목상하위치
                                  size = 15, color = "darkgreen",family = 'NanumGothic')) +
  geom_hline(yintercept=a1, color='purple', linetype = 'dashed')

#############강동구 병원 수
ggplot(data,aes(x=표시과목,y=강동구,fill=표시과목))+ 
  geom_bar(stat='identity',)+
  geom_text(aes(x=표시과목, y=강동구,label=v2*10, group=표시과목,family = 'NanumGothic'))+
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8,family = 'NanumGothic')) + 
  ggtitle('강동구 병원 수') +
  theme(plot.title = element_text(face = "bold", hjust = 0.7, vjust=1, 
                                  size = 15, color = "darkgreen",family = 'NanumGothic')) +
  geom_hline(yintercept=a2, color='purple', linetype = 'dashed')


############강서구 병원 수
ggplot(data,aes(x=표시과목,y=강서구,fill=표시과목))+ 
  geom_bar(stat='identity',)+
  geom_text(aes(x=표시과목, y=강서구,label=v3*10, group=표시과목,family = 'NanumGothic'))+
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8,family = 'NanumGothic')) + 
  ggtitle('강서구 병원 수') +
  theme(plot.title = element_text(face = "bold", hjust = 0.7, vjust=1, 
                                  size = 15, color = "darkgreen",family = 'NanumGothic')) +
  geom_hline(yintercept=a3, color='purple', linetype = 'dashed')

############관악구 병원 수
ggplot(data,aes(x=표시과목,y=관악구,fill=표시과목))+ 
  geom_bar(stat='identity',)+
  geom_text(aes(x=표시과목, y=관악구,label=v4*10, group=표시과목,family = 'NanumGothic'))+
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8,family = 'NanumGothic')) + 
  ggtitle('관악구 병원 수') +
  theme(plot.title = element_text(face = "bold", hjust = 0.7, vjust=1, 
                                  size = 15, color = "darkgreen",family = 'NanumGothic')) +
  geom_hline(yintercept=a4, color='purple', linetype = 'dashed')


###복붙 잘하면 된다
