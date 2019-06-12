install.packages("ggplot2")
library(ggplot2)
#기본적인 데이터의 골격을 보여준다다
# 그래픽은 항상 레이어를 쌓는다.
getwd()
setwd("D:/workspace/R_Data_Analysis/part4")
korean <- read.csv('data/학생별국어성적_new.txt',header=T,sep=','); korean
ggplot(korean,aes(x=이름,y=점수))+geom_point()
ggplot(mapping = aes(x=이름,y=점수),data=korean)+geom_point()

ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat = 'identity')
#색상채우기
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat = 'identity',fill='green',colour='red')
#
gg <- ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat = 'identity',fill='green',colour='red')
gg + theme(axis.text.x=element_text(angle=45,hjust = 1,vjust=1,
                                  color='blue',size=8))
getwd()학생별과목별성적_국영수_new
score_kem <- read.csv('data/학생별과목별성적_국영수_new.csv');score_kem
#csv로 엮여 있으면 굳이 sep을 써서 나눌 필요가 읍다.
library(dplyr)
sort_kem <- arrange(score_kem, 이름, 과목); sort_kem

#sort_kem2 <- ddply(score_kem, "이름", transform,누적합계=cumsum(점수)); sort_kem2

#누적합계라는 걸로 변수를 하나 만들기
sort_kem2 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수)); sort_kem2
#어떤 문제를 풀때 전처리과정은 dplyr을 사용 그래프를 ggplot2를 사용한다.

#점수의 전체합계별의 가운데 넣으려고 하는 함수
sort_kem3 <- sort_kem2%>%
  group_by(이름)%>%
  mutate(label=cumsum(점수)-0.5*점수); sort_kem3
#kem2,kem3를 함께 나타내기
sort_kem4 <- sort_kem %>%
  group_by(이름)%>%
  mutate(누적합계=cumsum(점수),label=cumsum(점수)-0.5*점수); sort_kem4

ggplot(sort_kem4,aes(x=이름,y=점수,fill=과목))+
  geom_bar(stat='identity')+
  geom_text(aes(y=label,label=paste(점수,'점')),angle=45,hjust = 1,vjust=1,colour='black',size=4)

gg2 <- ggplot(sort_kem4,aes(x=이름,y=점수,fill=과목))+
  geom_bar(stat='identity')+
  geom_text(aes(y=label,label=paste(점수,'점')),
            angle=45,hjust = 1,vjust=1,color='black',size=4) +
  guides(fill=guide_legend(reverse=T))

gg2+ theme(axis.text.x=element_text(angle=45,hjust = 1,vjust=1,
                                    colour='black',size=8))


score <- read.table('data/학생별전체성적_new.txt',header=T,sep=","); score
#sep을 . 으로 할때랑 ,으로 할때랑 결과값이 다르다
score_eng <- score[, c('이름','영어')]
ggplot(score, aes(x=영어,y=reorder(이름,영어))) +
  geom_point(size=6) +
  theme_bw()+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color='red',linetype='dashed'))

ggplot(score, aes(x=영어,y=reorder(이름,영어))) +
  geom_segment(aes(yend=이름,xend=0,color='blue'))+
  geom_point(size=6,colour='blue') +
  theme_bw()+
  theme(panel.grid.major.y = element_blank())


install.packages('gridExtra')
library(gridExtra)
v_mt <- mtcars

str(mtcars)
graph1 <- ggplot(v_mt,aes(x=hp,y=mpg))
  graph1 + geom_point()

ggplot(v_mt, aes(x=hp , y=mpg))+
  graph1 + geom_point()
#색상변경
ggplot(v_mt, aes(x=hp , y=disp))+
  geom_point(colour='blue')
#종류별로 다른색상지정
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(color=factor(am)))
#크기지정하기
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(color=factor(am),size=5))
#값별로 크기 지정
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(color=factor(am),size=wt))
#종류별 크기 모양
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(shape=factor(am),size=wt))
#종류별 색상을 그라데이션으로 지정하기
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(shape=factor(am),color=wt))
#선 추가 
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(shape=factor(am),color=wt))+
  geom_line()
# 값별 색상및 모양 변경
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(shape=factor(am),color=factor(am),size=wt))+
  scale_color_manual(values = c('red','green'))

#이름지정,x축 y축 변경
ggplot(v_mt, aes(x=hp , y=mpg))+
  geom_point(aes(shape=factor(am),color=wt))+
  labs(x='마력',y='연비(mile/gallon)')
#그래프에 여백의 미 살리기
par(oma=c(1,1,1,1))

#geom_line
three <- read.csv('data/학생별과목별성적_3기_3명.csv',header=T); three
sort_score <- arrange(three,이름,과목);sort_score
#이름으로 선그래프 출력
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()
#점수를 정확히 표시하기
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름))+
  geom_line()+geom_point()

# geom_point에 지정을 하는 경우와,aes에서 지정하는 경우의 차이점
# 1은 알아서 하나하나 지정해야하고, aes는 알아서 지정해준다
#shape로 point모양 변경하기,fill로 shape을 채우기,제목설정하기
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름,fill=이름))+
  geom_line()+geom_point(shape=22)+
  ggtitle('학생별 과목별 성적',)

#geom_area()
dis <- read.csv('data/1군전염병발병현황_년도별.csv',stringsAsFactors=F); dis
ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+
  geom_line()
#stringsAsFactors의 T&F비교해보기.
str(dis)
#색지정 및,alpha로 진하기 지정
ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+
  geom_area(color='red',fill='cyan',alpha=0.4)

#x,y축 색 따로 지정하기
ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+
  geom_area(fill='cyan',alpha=0.4)+
  geom_line(color='blue')

