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
select(data1,순위:타수)
select(data1,-타율:-연봉)
data1 %>%
  select(선수명,팀,경기,타수) %>%
  mutate(경기x타수 = 경기*타수)%>%
  arrange(경기x타수)
# 
# data1 %>%
#   select(선수명,팀,경기,타수) %>%
#   mutate(경기x타수 = 경기*타수)%>%
#  arrange를 빼면 결과값이 안나온다.

data1 %>%
  group_by(팀) %>%
  summarise(avarage =mean(경기,na.rm = TRUE))
  
data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean,sum,n()),연봉,타수)

# #dplyr데이터 전처리
# 기초통계량,간단집계 - summarise()
# 새로운 데이터프레임에 새로운 열 추가 - mutate()
# 두 개 이상의 변수에 대한 처리 - summarise_at(),mutate_at()
# 첫번째 인자에 대상이 되는 변수 나열,구하고 싶은 함수 - funs()

#연습문제
install.packages('googleVis')
library(googleVis)
library(dplyr) #끌어 내려오면 값을 간단하게 만드는 함수
attach(Fruits)

Fruits

f1<- filter(Fruits,Expenses>80) ;f1 #1번

Fruits %>%
  filter(Expenses>90) %>%
  arrange(Sales)#2번

F3 %>%
  filter(Expenses > 90)%>%
  arrange(Sales)#3번


F4 <- filter(Fruits,Expenses%in%c('79','91'));F4#4번



# Fruits %>%
#   summarise_at(funs(Expenses>90,sales>90)) #2번


#P.412 답
######
Fruits %>%
  group_by(Fruit) %>%
  mutate(sumSales = sum(Sales))





###########