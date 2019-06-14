getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage1 word cloud/190613도전미션")

data1 <- read.csv('마포09번이용현황.csv')
str(data1)



ggplot(bus09, aes(x=정류소명)) +
  geom_point(color='orange', aes(x=number, y=승차인원)) +
  geom_line(color='orange', aes(x=number, y=승차인원)) +
  labels = c(승차인원)
  geom_point(color='blue', aes(x=number, y=하차인원)) +
  geom_line(color='blue', aes(x=number, y=하차인원)) +
  labels = c(하차인원) 

  # geom_bar(stat='identity')+
  # geom_text(aes(x=승차인원, y='',label=v1*10, group=표시과목,family = 'NanumGothic'))+ #familly는 데이터안에 들어가는 글씨
  # theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
  #                                colour="black", size=8,family = 'NanumGothic')) +  #angle-제목 기울기,familly-x.y축글씨
  # ggtitle('강남구 병원 수') +
  # theme(plot.title = element_text(face = "bold", hjust = 0.7, vjust=1, #hjust-제목좌우위치,vjust-제목상하위치
  #                                 size = 15, color = "darkgreen",family = 'NanumGothic')) +
  # geom_hline(yintercept=a1, color='purple', linetype = 'dashed')
