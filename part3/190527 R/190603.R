install.packages('plyr')
library(plyr)
fruits <- read.csv("fruits_10.csv", header = T)
fruits
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))
ddply(fruits,'name',summarise,sum_qty=max(qty),sum_price=min(price))
ddply(fruits,c('year','name'),summarise,max_qty=max(qty),max_price=min(price))#원하는 column의 이름의 다를때 
ddply(fruits,'name',transform,sum_qty=sum(qty),pct_qty=(100*qty)/sum(qty))
#각 행렬별 평균값을 구함.

install.packages('dplyr')
library(dplyr)
data1 <- read.csv('2013년_프로야구선수_성적.csv')
data1
data2 <- filter(data1,경기>120)
data2
data3 <- filter(data1,경기>120&득점>80)
data3
data4 <- filter(data1,포지션%in%c('1루수','3루수'))
data4
select(data1,선수명, 포지션, 팀)
