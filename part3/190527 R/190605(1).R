#sqldf()패키지활용
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits
#SQL이랑 비슷
#싱글코트로 감싸야함
sqldf('SELECT * FROM Fruits')
#세번째 부터 다섯개를 보여줘
sqldf('SELECT * FROM Fruits
      WHERE Fruit = \'Apples\' ')
sqldf('SELECT * FROM Fruits limit 3, 5')
#ODER BY 안에는 기본적으로 오름차순(아래로 내려갈수록 커짐)이다
sqldf('SELECT * FROM Fruits
+       ORDER BY Year')
sqldf('SELECT * FROM Fruits')#이거 안 Year는 순서가 약간 다르다.
sqldf('SELECT * FROM Fruits
        ORDER BY Year Desc')# Desc이거는 내림차순
#합계판매량 구하기  
sqldf('SELECT SUM(Sales)FROM Fruits')
# 과일별로 묶어서 그 값의 sale의 합계 값만 넣어줘
sqldf('SELECT Fruit, SUM(Sales)FROM Fruits group by Fruit') 
#과일의 세일 가격 profit의 합계가격
sqldf('select Fruit, sum(sales),sum(Expenses),sum(Profit)
      FROM Fruits group by Fruit')

#!연도별 평균 매출 평균 
sqldf('select Year, avg(sales),avg(Expenses),avg(Profit)
      FROM Fruits group by Year')
#avg(profit)이익의 내림차순
sqldf('select Year, avg(sales),avg(Expenses),avg(Profit)
      FROM Fruits group by Year
      ORDER BY avg(Profit) Desc')#!의 가격을 구하려고 했으니까 avg(Profit)으로 넣어야한다.)


#sale의최대최소값을 구하자 듀개를 같이 쓸수 있따.
sqldf('select max(Sales),min(Sales) from Fruits')
##이건 문말이지??
sqldf('select min(Fruit),max(Fruit) from Fruits')
Fruits

#과일별 가격의 평균
sqldf('select Fruit, avg(Sales)
      from Fruits
      group by Fruit')
#서브쿼리 

sqldf('select * from Fruits
      where Sales > (select Sales
                    from Fruits
                    where expenses = 78)')
#####
#위에있는거 풀어 넣어서 해보기
sqldf('select * from Fruits
      where Sales')
sqldf('select Sales
     from Fruits
     where expenses = 78')

#값이 완전 다름

getwd()
song <-  read.csv("song.csv", header = F, fileEncoding = 'utf8')
names(song) <- c('_id','title','lyrics','girl_group_id')
song
girl_group <- read.csv("girl_group.csv", header = F, fileEncoding = 'utf8')
names(girl_group) <- c('_id','name','debut')
girl_group

sqldf("select gg._id, gg.name, gg.debut, s.title
      from girl_group AS gg
      inner join song as s
      ON gg._id = s.girl_group_id")
sqldf
#as를 뺴도 된다. 


