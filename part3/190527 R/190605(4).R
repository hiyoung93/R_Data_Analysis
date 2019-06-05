# 반복문(for 한정적,while 범위가 넓다)
#조건식에 영향이 있는 아이를 넣어야지 계속가지 않는다.
###############
no <- 0
while(no <3){
  print(no)
  no <- no+1
}


number <- 0
while (number < 5) {
  print(number)
  if (number == 3)
    break
  number <- number + 1
}


no <- -1
while (number <= 10) {
  number <- number + 1
  if (number %%2== 1)
    next
  print(number)
}


z<- -1
while (number <= 10) {
  number <- number + 1
  if (140 %% z == 0)
    next
  print(number)
}
number
################

############
for (i in 1:10) {
  print(i)
}
sum <-0
for(i in 1:100) {
  sum <- sum + i
}
print(sum)
#sum 은 안에 가둬두고 

sum <- 0
for(i in 1:100 ) {
  if(i %%3==0)
    sum <- sum + i
}
print(sum)

#3:100까지 배수

#######
for(i in 3:100 ) {
  if(i %%3==0)
   print(i)
}


no <- 0
while(no<5){
  print(no)
  no <- no+1}

x <- 1
while(x<5){x <- x+1; if(x==4)break; print(x);}


# 에러남 이유는 몰륵세
x <- 1
while(x<12){x <- x+1; if(x <- 2)next; print(x);}
print(x)


#########
multiple(1000,4)
library(stringr)


for(i in 1:5){
  line <- ''
  if (i != 1) {
    for (k in 1:(1-i)) 
      line <- str_c(line, ' ')
  }
  for(k in i:5)
    line <- str_c(line, '#')
  }
  print(line)

############
  x %% y == 0
#1번 구구단 만들기
for(i in 2:9){
  for( k in 1:9){
    print(paste(i,'*', k ,'=', i*k))
    }
}
#2번'#'으로 다이아몬드 만들기
while(T){
  for (i in 1:4){
    line <- ''
    if (i!=4){
      for (k in 1:(3-(i-1)))
        line <- str_c(line, ' ')
    }
    for (k in 1:(2*i-1))
      line <- str_c(line, '#')
    print(line)
    }
  break;
}

#3번 약수 구하는 함수
a <- function(x) {
  den <- c(1)
  if(x>=2){
    for(i in 2:x) {
      if(x %% i==0)
        den <- c(den,i)
    }
  }
  return(den)
}
a(451)

#bool형으로 나옴
for(i in 1:9){
  for(k in 1:9){
    print(i %% k == 0)
  }
}

  