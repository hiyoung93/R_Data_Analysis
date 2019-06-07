x <- 1:5
barplot(x)
barplot(x,horiz=T)#가로로 출력하는 함수;horiz

x <- matrix(c(5,4,3,2,4,5),2,3)
barplot(x,beside = T,names=c(5,4,1),col=c('purple','green','yellow'),)
#beside는 한 열에 나오는 그래프를 한 그룹으로 묶는다.
barplot(x,names=c(5,4,1),col=c('purple','green','yellow'),ylim =c(0,10))
x

x <- matrix(c(5,4,3,2),2,2)#matrix는내가 직접하나하나 값을 넣는것
par(oma=c(1,0.5,1.0,5))
barplot(x,names=c(5,3),beside=T,col=c('green','yellow'),horiz=T)

barplot(x,horiz=T,names=c(5,3),col=c('green','yellow'),xlim=c(0,12))
#한 열에 같은 값을 추가하고 가로로 출력시킬때 쓰는 함수,(beside,horiz)

v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(banan=v1,cherry=v2,orange=v3) 
#dataframe은 내가 값을 만들고 값을 넣어줌
qty

par(oma=c(0,0,0,0))
barplot(as.matrix(qty),main = "Fruit's Sales QTY",
        beside=T, col=rainbow(nrow(qty)),ylim=c(0,450))
legend(11,400,c('mon','tue','wed','thu','fri'),cex=0.8,fill=rainbow(nrow(qty)))        
#legend(x축 위치,y축 위치,내용,cex=글자크기,col=색상,pch=크기,lty=선모양)


barplot(t(qty),main='Fruits Sales QTY',ylim=c(0,900),
        col=rainbow(length(qty)),space=0.1,cex.axis=0.8,las=1,
        namas.arg=c('mon','tue','wed','thu','fri'),cex=0.8)
legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty)))        
#T();전치행렬함수를 쓰는 이유.보기좋게하려규
plot.new
peach <- c(180,200,250,198,150)
colors <- c()
for(i in 1:length(peach))
  {if (peach[i]>=200)
    {colors <- c(colors,'red')}
  else if (peach[i]>=180)
    {colors <- c(colors,'yellow')}
  else
    {colors <- c(colors,'green')}
}
barplot(peach,main="Peach Sales QTY",
        names.arg = c('mon','tue','wed','Thu','Fri'),col=colors)
plot.new()

par(mfrow=c(1,1))
height <- c(194,183,150,173,130,199,174,166,159,155)
hist(height,main='histogram of height')


par(mfrow=c(1,2),oma=c(2,2.0,0.1,0.1))
hist <- c(1,1,2,3,3,3)
hist(hist)
plot(hist,main='plot')
