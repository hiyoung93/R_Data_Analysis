#여러 프로젝트를 하면 함수를 만들어야한다.
#Function 
#help 기능 : ? 사용
vec1<- c(1:5)
vec2 <- c('a','b','c','d','e')
max(vec1)
max(vec2)

mean(vec1)#문자는 평균함수는 사용하지 못한다.
min(vec1) #최소값
sd(vec1)#표준편차 전나 중요하단다. 
sum(vec1)#합계
var(vec1)#분산 전나 중요하단다.(통계)

library(googleVis)
Fruits

#Aggregate(계산될 컬럼~ 기준이 될 컬럼, 데이터, 함수)

aggregate(Sales~Year, Fruits, sum)#여기에 원하는 함수를 마음대로 넣어보자
aggregate(Sales~Year, Fruits, max)
aggregate(Sales~Year, Fruits, mean)# 왜 3을 나눔?
#품목별~
aggregate(Sales~Fruit, Fruits, sum) 값다마 넣어주면된다.
#dataFrame에 대해서 열라게 고민해보자

aggregate(Sales~Fruit, Fruits, max) #최대값값



aggregate(Sales~Fruit+Year, Fruits, sum) #추가로 구하고 싶은 값은 '+'를 사용한다.

#내가 원하는 어떠한 함수를 사용할지를 정한다.
mat1 <- matrix(c(1:6),nrow = 2,  byrow =T); mat1 


apply(mat1, 1, sum)  #1 - 행 단위을 열
apply(mat1, 1, prod)
apply(mat1, 2, sum)  #열 행단위의 얄
apply(mat1[,c(2,3)], 1,)


list1 <-  list(Fruits$Sales);list1
list2 <-  list(Fruits$Profir); list()
lapply(c(list1, list2), max) 
sapply(c(list1, list2), max)
lappy(Fruits[,c(4,5)],matx)
lappy(Fruits[,c(4,5)],matx)

Fruits
tapply(Sales, Fruits, Sum) 
attach(Fruits)
tapply(Sales, Fruit, sum)
tapply(Sales, Year, sum)

vec1 <-  c(1:5)
ver2 <- seq(10, 35,10)
vec3 <-  seq(100,500, 199)
mapply(sum,vec1, vec2, vec3)

#연습문제 풀기p.394

data <-  read.csv('data1.csv'); data
apply(data[,c(2:15)],2,sum)#답 == apply(data1[,c(2:15),2,sum)
apply(data[,c(2:15)],1,sum)#답 == apply(data[,-1],1,sum), 첫번째 columns를 제외한것과 같으므로 -1로 표기해도 된다.

# #SQL에대한 
# 아래로 나오는건 aggregate()
# 옆으로 나오는건 tapply()

data2 <- read.csv('1-4호선승하차승객수.csv'); data2

aggregate(노선번호~승차,data2,sum)
tapply(승차,하차, length)
attach(data2)
tapply(승차,노선번호,sum)#2-1  
#답 == 먼저 attach(data2);tapply(승차,노선번호,sum)
tapply(하차,노선번호,sum)#2-2 답== tapply(하차,노선번호,sum)

apply(승차,하차,sum)#2-3 포기함 답 != sapply(data2[,c(3,4)],sum) 

aggregate(승차+하차~노선번호,data2,sum)#2-4
aggregate(승차~노선번호,data2,sum)#2-5
aggregate(하차~노선번호,data2,sum)#2-6

