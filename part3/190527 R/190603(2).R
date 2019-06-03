
install.packages("stringr")
library(stringr)
fruits <- c('apple','Apple','banana','pineapple')
str_detect(fruits, 'A')
str_detect(fruits,'^a')
str_detect(fruits,'e$')
str_detect(fruits,'^[aA]')
str_detect(fruits,'[aA]')
str_detect(fruits,regex('a',ingnotr_case = T))

fruits
str_count(fruits,'a')

str_c('apple','banana')
str_c('Fruits:',fruits)
str_c(fruits,"name is", fruits)
str_c(fruits,collapse = "")
str_c(fruits,collapse = '-')
str_dup(fruits,3)
str_length('apple')
str_length(fruits)
str_length('과일')
str_locate('apple','ap')
str_locate(fruits,'ap') #다른 언어와 다르게 끝나는 지점과 시작지점이 같아서 이렇게 나온다.
str_replace('apple','p','*')
str_replace('apple','p','**')
str_replace_all('apple','appl','*')#전부 해달라니까 전부해쥬주닌 아늠.

str_split()
fruits <- str_c('apple','/','orange','/','banana')
fruits

str_split(fruits,'/')
#이건 리스트 타입,

str_sub(fruits,start=1,end=3)
str_sub(fruits,start=6,end=9)
str_sub(fruits,start=-5)
str_sub(fruits,end=7)#end도 가능하고start도 가능하다

str_trim('apple banana berry')
str_trim(' \t apple banana berry')
#\t과\n 도 되어있기 땜에 화이트
# 스트링은 많이 안
# 조건식 반복식을 하면 복잡어려운거 마니함
# 데이터분석ㅎ