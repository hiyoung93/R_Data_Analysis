library(igraph)
library(devtools)
library(plyr)
library(gridExtra)
library(ggplot2)

# 1. data mpg 의 cty와 hwy간 어떤 관계가 있는지 알아보기,x축 cty y축 hwy으로 산점도

View(mpg)
str(mpg)
mg1 <- ggplot(mpg,aes(x=cty , y=hwy)); mg1+geom_point()

# 2. data midwest 로 x 축poptotal(전체인구,50만명이하), 
# y축 popasian(아시아인인구,1만명이하)산점도

View(midwest)
mdg2 <- ggplot(midwest,aes(x=poptotal , y=popasian))+
  coord_cartesian(xlim = c(0, 500000), ylim = c(0,10000))

mdg2+geom_point()

# 3. data mpg로 suv차종 도시연비 알아보기.
# 평균 cty가 높은 회사 다섯곳을 bargraph로 연비높은순으로표현  
# class중 suv를 뽑은 상태에서 cty(도시연비)를 뽑으려고 한다.

m3 <- subset(mpg,class=='suv'); m3
subset(m3, select=c(manufacturer,cyl,class))

ggplot(m3,aes(x=manufacturer,y=cty,fill=manufacturer))+
  geom_bar(stat='identity')

# 4. data mpg중 class별 빈도 표현 후 bar graph
# dplyr로 class 를 숫자로 표현 후 표만들기
# class별 합계를 구하고 싶은데.. 어케하는지 모르겠음..
#########
m4 <- subset(mpg,select=c(manufacturer,class)); m4
View(m4)
str(m4)
m4d <- ddply(m4,'class'); m4d

ggplot(m4d, aes(x=manufacturer,y=class,ylim=))+geom_bar(stat='identity')

summarise(count(df,vars = m4d,wt_var))

# summarise by group
m4d <- group_by(mpg, class) %>%
  summarise(m4d,차종별 = n())
# Call `rlang::last_error()` to see a backtrace 이것은 무슨의미인가요 ㅜㅜ
#####
# ㅋㅋㅋㅋㅋㅋ존나 간다..;;
ggplot(mpg, aes(x=class, fill=class))+
  geom_bar()




# 5. data economics 로시간에 따른 psavert의 시계열 그래프 
View(economics)
ggplot(economics, aes(x=date, y=psavert, group=1)) + geom_line()

# 6. class별 "compact", "subcompact", "suv" 의 cty는 어떻게 다른가 boxplot으로 표현
mpg 
m6c <- subset(mpg,class=='compact',select='cyl');m6c
m6s <- subset(mpg,class=='subcompact',select='cyl');m6s
m6v <- subset(mpg,class=='suv',select='cyl');m6v

par(mfrow=c(1,3))
boxplot(m6c)
boxplot(m6s)
boxplot(m6v)



df_3class <- mpg %>%
  fillter(class %in% c('compact','subcompact','suv'))
ggplot(df_3class, aes(x=class, y=cty))

#7-1
ggplot(diamonds ,aes(x=cut, fill=cut))+
  geom_bar()
#7-2
df_cut <- diamonds%>%
  group_by(cut) %>%
  summarise(count=n())
ggplot(df_cut, aes(x=cut, y=mean_price, fill=cut)) +
  geom_col()

library(rlang)

#7-3
ggplot(diamonds ,aes(x=price))+
  geom_histogram()
