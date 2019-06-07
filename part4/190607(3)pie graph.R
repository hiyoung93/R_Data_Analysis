par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius = 0.5)#radius는 전체의 크기를 뜻함
pie(p1,radius = 1,init.angle = 90)
#시작각도 90도 부터, 각도를 바꾸면 전체 글자도 바뀜
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=c('week1','week2','week3','week4'))
#label을 지정해주고 col을 지정해주니 알아서 색이 변한다.

pct <- round(p1/sum(p1)*100,1)
lab <-  paste(pct,'%')
pie(p1,radius = 1,init.angle=90,col=rainbow(length(p1)),
    label=lab)
legend(1,1.1,c('week1','week2','week3','wee4'),
       cex = 0.5,fill=rainbow(length(p1)))


v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3,col=c('blue','yellow','pink'),
        names=c('blue','yellow','pink')
        ,horizontal=T)
par(mfrow=c(1,1),oma=c(0,0,0,0))
#p.478안되는 이유눈 모루겟오
######
setwd("D:/workspace/R_Data_Analysis/part4/data")
install.packages('igraph')
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1)
png('network_2.png',width = 600, height = 600)
plot(1:10,type='1')
#######