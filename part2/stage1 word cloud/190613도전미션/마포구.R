setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/190613도전미션")
library(ggplot2)
library(ggthemes)
library(dplyr)
library(reshape2)
library(extrafont)
windowsFonts()
windowsFonts(NanumGothic = "NanumGothic")
theme_update(text = element_text(family = "NanumGothic"))



bus09 <- read.csv('마포09번이용현황.csv')
length(bus09$승차인원) # 중복되는 값은 알아서 지워준다.



bus09$number <- c(1:length(bus09$승차인원))
#값이 안찍힘 X축에 값이 없어서 안찍힌다, 라인이 안그려지던뎅..?

stop <- bus09$정류소명


ggplot(bus09, aes(x=정류소명)) +
  geom_point(color='orange', aes(x=number, y=승차인원)) +
  geom_line(color='orange', aes(x=number, y=승차인원)) +
  geom_point(color='blue', aes(x=number, y=하차인원)) +
  geom_line(color='blue', aes(x=number, y=하차인원)) +
  labs(x='정류소명', y='승하차 인원 (단위: 천명)') + #lab을 사용하면 x,y에 원하는 글을 쓸 수 잇다,
  scale_x_continuous(breaks = 1:32, labels = stop) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  scale_y_continuous(breaks = seq(0,40000,10000), labels = c(0,10,20,30,40)) +
  ggtitle('마포09번 정류소별 승하차 인원') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=seq(0, 40000, 10000), 
             color='grey', linetype = 'dashed', size=0.1) +
  geom_vline(xintercept=seq(0, 30, 5), 
             color='grey', linetype = 'dashed', size=0.1)







mBus <- melt(bus09, id=c('정류소명'),
             variable.name='구분', value.name='인원')

mBus <- mBus %>%
  filter(구분 %in% c('승차인원', '하차인원'))
mBus

ggplot(mBus, aes(x=정류소명, y=인원, color=구분, group=구분)) +
  geom_point(size=3) +
  geom_line(size=1) +
  labs(x='정류소명', y='승하차 인원 (단위: 천명)') +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  scale_y_continuous(breaks = seq(0,40000,10000), labels = c(0,10,20,30,40)) +
  ggtitle('마포09번 정류소별 승하차 인원') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=seq(0, 40000, 10000), 
             color='grey', linetype = 'dashed', size=0.1) +
  geom_vline(xintercept=seq(0, 30, 5), 
             color='grey', linetype = 'dashed', size=0.1)
