library(igraph)
library(devtools)

#1.1
######
a_p <- subset(iris,Species=='setosa')
a_p1 <- a_p[,3:5]
a_p1

library(ggplot2)
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


#
######
a_p <- subset(iris,Species=='setosa')
a_p<-a_p(mean(iris$Sepal.Length=='setosa'))
a_p
a_p1 <- a_p[,3:5]




###############
iris
View(iris)
library(ggplot2)
library(igraph)
library(devtools)

#품종별 4가지 평균
iris%>%
  group_by(Species)%>%
  summarise_each(funs(mean))
#list의 각각의 값과 funs의 값은 같다  
# iris%>%
#   group_by(Species)%>%
#   summarise_each(list(mean),Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)



#품종별로 sepal의 length&width,  petal의 length&width, 평균값을 구하라 
############
library(ggplot2)
plot.new
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_bar(stat='identity')

gg <- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_bar(stat='identity',fill='green',
                                                              colour='red')
gg+theme(axis.text.x=element_text(angle=45,hjust = 1,vjust=1,
                                  color='blue',size=8))


library(plyr)
mean_sl <- aggregate(Sepal.Length~Species,iris,mean)
mean_sw <- aggregate(Sepal.Width~Species,iris,mean)
mean_sl 
mean_sw

plot.new

plot(mean_sw)
axis(1,at=1:3,lab=c('setosa','versicolor','virginica'))
axis(2,ylim=c(0,7))

sepal_ <- ddply(iris,'Species',transform,sepal=cumsum(sepal.Length))

#ddply(iris,'Species',summarise,Length=mean(petal.Length),Width=mean(petal.Width))
a<-ddply(iris,'Species',summarise,Length=mean(Sepal.Length),Width=mean(Sepal.Width))
barplot(a,)
a

iris
library(plyr)
library(ggplot2)
library(igraph)
library(devtools)
a <- aggregate(Sepal.Length~Species,iris,mean)
# ddply(iris,'Species',summarise,Length=mean(Sepal.Length),Width=mean(Sepal.Width))
# 같은 결과값
b <- aggregate(Sepal.Width~Species,iris,mean)
c <- aggregate(Petal.Length~Species,iris,mean)
d <- aggregate(Petal.Width~Species,iris,mean)
plot(a,type='s') 
plot(b,type='o') 
plot(c,type='o') 
plot(d,type='o')


ab <- merge(a,b,key='Species')
ab
barplot(as.matrix(ad[1:3,2:3]))
iris
iris%Species
###########
#포기


#품종별 평균치로 barplot으로 비교하기


#matrix를 행렬과, 벡터로 구하는 방법을 모르겟;


#boxplot으로 12개 그리기

ggplot(data=iris,aes(x=Petal.Length, y=Petal.Width )) + geom_point()
ggplot(data=iris,aes(x=Petal.Length, y=Petal.Width ),
       geom_hline(setosa=mean(iris$a_s), linetype='dashed'))
################

