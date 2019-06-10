library(igraph)
library(devtools)
library(ggplot2)
library(plyr)
#1.1
#1번 풀이법 - 문제는 각각의 줄기와 받침반? 의 평균을 구하고 그래프로 나타냈다.

#품종별로 sepal의 length&width,  petal의 length&width, 평균값을 구하고 그래프로 나타내기
######
a_p <- subset(iris,Species=='setosa')
a_p1 <- a_p[,3:5]
a_p1

ggplot(a_p1, aes(x=Petal.Length,y=Petal.Width)) + geom_bar(stat="identity") + 
  labs(x="Petal.Length", y="Petal.Width")
#1.2
a_s <-  subset(iris,Species=='setosa')
a_s1 <- a_s[,-3:-4]
a_s1
ggplot(a_s1, aes(x=Sepal.Length,y=Sepal.Width)) + geom_bar(stat="identity") + 
  labs(x="Sepal.Length", y="Sepal.Width")
#1.3
v_s <- subset(iris,Species=='versicolor')
v_s1 <- v_s[,-3:-4]
v_s1
ggplot(v_s1, aes(x=Sepal.Length,y=Sepal.Width)) + geom_bar(stat="identity") + 
  labs(x="Sepal.Length", y="Sepal.Width")
#1.4
v_p <- subset(iris,Species=='versicolor')
v_p1 <- v_p[,3:5]
v_p1
library(ggplot2)
ggplot(v_p1, aes(x=Petal.Length,y=Petal.Width)) + geom_bar(stat="identity") + 
  labs(x="Petal.Length", y="Petal.Width")

par(mfrow=c(1,4))
ggplot(data=a_p1,aes(x=Petal.Length, y=Petal.Width )) + geom_point()
ggplot(data=a_s1,aes(x=Sepal.Length, y=Sepal.Width )) + geom_point()

ggplot(data=v_p1,aes(x=Petal.Length, y=Petal.Width )) + geom_point()
ggplot(data=v_s1,aes(x=Sepal.Length, y=Sepal.Width )) + geom_point()

######

plot.new()
#2번  
############

ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_bar(stat='identity')

gg <- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_bar(stat='identity',fill='green',
                                                              colour='red')
gg+theme(axis.text.x=element_text(angle=45,hjust = 1,vjust=1,
                                  color='blue',size=8))



mean_sl <- aggregate(Sepal.Length~Species,iris,mean) ;mean_sl 
mean_sw <- aggregate(Sepal.Width~Species,iris,mean) ;mean_sw


plot(mean_sw)
axis(1,at=1:3,lab=c('setosa','versicolor','virginica'))
axis(2,ylim=c(0,7))

sepal_ <- ddply(iris,'Species',transform,sepal=cumsum(Sepal.Length)) ;sepal_

a<-ddply(iris,'Species',summarise,Length=mean(Sepal.Length),Width=mean(Sepal.Width)) ;a
barplot(a,)


a <- aggregate(Sepal.Length~Species,iris,mean)
#ddply(iris,'Species',summarise,Length=mean(Sepal.Length),Width=mean(Sepal.Width))
# 같은 결과값
b <- aggregate(Sepal.Width~Species,iris,mean) ;b
c <- aggregate(Petal.Length~Species,iris,mean);c
d <- aggregate(Petal.Width~Species,iris,mean);d
plot(a,type='s') 
plot(b,type='o') 
plot(c,type='o') 
plot(d,type='o')


ab <- merge(a,b,key='Species');ab
barplot(as.matrix(ad[1:3,2:3]))

###########
#포기



#matrix를 행렬과, 벡터로 구하는 방법을 모르겟;


#3번 - boxplot으로 12개 그리기
ggplot(data=iris ,aes(x=Sepal.Length, y=Sepal.Width )) + geom_point()
ggplot(data=iris ,aes(x=Petal.Length, y=Petal.Width ))+ geom_point()

ggplot(data=iris ,aes(iris$setosa, x=Sepal.Length, y=Sepal.Width )) + geom_point()
ggplot(data=iris ,aes(iris$setosa, x=Petal.Length, y=Petal.Width )) + geom_point()

ggplot(data=iris ,aes(iris$versicolor, x=Sepal.Length, y=Sepal.Width )) + geom_point()
ggplot(data=iris ,aes(iris$versicolor, x=Petal.Length, y=Petal.Width )) + geom_point()

ggplot(data=iris ,aes(iris$virginica, x=Sepal.Length, y=Sepal.Width )) + geom_point()
ggplot(data=iris ,aes(iris$virginica, x=Petal.Length, y=Petal.Width )) + geom_point()

################

library(igraph)
library(devtools)
library(ggplot2)
library(plyr)
1
#산점도를 그리는 목적
#품종별 차이를 알아야 함
#filter를 사용해서 같은 아이에 대해서 스케일을 같이해서 어디에 분포되어있는지를 알아야한다.
#스케일별 이런저런 모양을 알아야함.
#limmit 를 품종별로 전부 계산해야한다.

2
#평균비교
#품종별로 bar그래프를 그리기
#평균을 구하고 컬럼네임을 주면 그릴수 있다.
#
#
3
# boxplot그리기 
# 품종별로 그리기
# 시험문제 ..
# 이상치 그리기
