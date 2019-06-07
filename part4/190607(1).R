#그래프 기초
setwd("D:/workspace/R_Data_Analysis/part4")
var1 <-1:5
plot(var1,xlab='g',ylab='f',type='h')
var2 <- c(2,2,2,2)
plot(var2)
x <- 1:3
y <- 3:1
plot(x,y)
x <- 1:3
y <- 3:1
plot(x,y,xlim=c(1,10),ylim=c(1,5))
x <- 1:3
y <- 3:1
plot(x,y,xlim = c(1,10),ylim=c(1,5),
     xlab = 'x축 값', ylab='y축 값',
     main='Plot Test')
#p.454 6번코드 만들기 혼자해봄
# x <- c('MON','TUE','WED','THU','FRI')
# y <- c(0:150)
# plot(x,y,xlim = ,ylim = c(1,50),
#     xlab='DAY',ylab='price',
#     main = 'FRUIT')

#6번 코드
v1 <- c(100,130,120,160,150)
plot(v1,type = 'o',col='red',ylim=c(0,200),axes=F,ann=F)

axis(1,at=1:5,lab=c('MON','TUE','WED','THU','FRI'))
axis(2,ylim=c(0,200))

title(main = 'FRUIT',col.main='red',font.main=15)
title(xlab = 'DAY',col.lab='black')#기본폰드가 따로 있고 폰트마다 번호가 지정되어있다.
title(ylab = 'PRICE',col.lab='blue')

v1
par(mfrow=c(1,3))
plot(v1,type='o')
plot(v1,type='s')
plot(v1,type='l')
# 
# Error in plot.new() : figure margins too large
# 계속 위처럼 오류가 났을때엔 윈도우를 재설정한다.
# par('mar')
# par(mar=c(1,1,1,1))
# par()

par(mfrow=c(1,3))#한 표 안에 내가 원하는 갯수의 그래프를 전부 넣을수 있다.
pie(v1)
plot(v1,type='o')
barplot(v1)


a <- c(1,2,3)
plot(a,xlab='aaa')

#그래프 에러 났을때 사용하는 코드
############
# 
# par(mar=c(5.1,4.1,4.1,2.1))#라인수로 마진크기 조정
# par(mai=c(1.02,0.82,0.82,0.42))#인치단위로 마진크리조정
# par(pin=c(5,4))
# 

# plot.window(xlim = xlimits,ylim = ylimits,asp=1)

# plot(cars)
# par(mfrow=c(2,2))
# plot(cars)
# dev.off()
# sessionInfo()
# RStudio.Version()
##########

a <- 1:3
plot(a,xlab = 'aaa')

par(mgp=c(0,1,0))#mgp=c(제목위치,지표값위치,지표선위치)
plot(a,xlab='aaa')
par(mgp=c(3,1,0))
plot(a,xlab='aaa')
par(mgp=c(3,2,0))
plot(a,xlab='aaa')
#
par(mgp=c(3,2,1)) #지표선위치 <- 숫자와 그래프를 띄어주는 것
plot(a,xlab='aaa')

par(oma=c(2,1,0,0))#oma <- 그래프 전체의 여백조정
plot(a,xlab='aaa')

par(oma=c(0,1,0,0))#oma(아래,왼쪽,위,왼쪽)
plot(a,xlab='aaa')

par(mfrow=c(1,1))#위에서 한 표 안에 3개가 표시되는 것을 1개가 표시되게나오는 코드
v1 <- 1:5
v2 <- c(5,4,3,2,1) 
v3 <- 3:7
plot(v1,type='s',col='red',ylim =c(1,5))#위에서 설정했던 oma가 아래쪽에도 연결된다.
par(new=T)#한 그래프에 전부 출력하려면 필요함
plot(v2,type='o',col='blue',ylim =c(1,5))
par(new=T)# 한번에 같이 출력하니까 Y축의 글자도 같이나와서 보기 힘듦
plot(v3,type='l',col='green')


v1 <- 1:5
v2 <- c(5,4,3,2,1) 
v3 <- 3:7
plot(v1,type = 's',col='red',ylim=c(1,10))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type='l',col='green',ylim=c(1,15))

legend(4,9,c('v1','v2','v3'),cex=0.9,col=c('red','blue','green'),lty = 1)
#선이 어떤걸 표시해주는지 알려주는 함수;legend

