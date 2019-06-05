f_plus <- function(x) {if (x < 0) {return(-x)}
  else{return(x) } }
f_plus(-123)

# if 조건문은 

myAbs <- function(x) { 
  if(x > 0) {
  return(x)  
  } else {
    return -x
  }
}
myAbs(-3.2)
# ##return 두개가 위아래 있으면 else는 굳이 사용하지 않아도된다
# 어차피 위로 돌아가기 떄문
# if는 재미있는 아잉
# if 절 안에 if 가 올수 잇따
# if를 계속 사용할때는 들여쓰기(Indent)을 잘하자

########연습문제
mf1 <-  function(x){
  if (x > 0) {
    x <- x*x
    return(x)}
  else {
    x <- x*0
    return(x)}
}
mf1(-231)
# #문자를 조건식으로 만드는 연습
# x가 x>0면 x*x, x가 x<0 면 0으로 출력  
number <- scan()
number
result <-  scan()

#####
#연습문제P437

myf1 <- function(x){
  if (x>5) {
    x <- 1
    return(x)}
  else{
    x <- 0
    return(x)}
}
myf1(61)
myf1(2) #1번

myf2 <- function(x){
  if (x > 0) {
    x <- 1
    return(x)}
  else{
    x <- 0
    return(x)}
  } 
myf2(0)
myf2(12)
myf2(-23)#2번

myf3 <- function(x,y,z){
  if (x > y){
      z <- x-y
      return(z)}
    else {
      z <- y-x
      return(z)}
    }
myf3(56,23)#3번
# 
# x<0 - 0
# x==1,2,3,4,5 - 1
# x>5 - 10

myf4 <- function(x){
  if(x<0){
    x <- 0
    return(x)}
  else if (x>=1 & x<=5){
    x <- 1
    return(x)}
  else {
    x <- 10
    return(x)}
  }
myf4(1)
myf4(123)#4번

yes <- scan()
ifelse(yes==y|Y,'Yes!')
ifelse(yes==*,'Not Yes..')#5번 

ex5 <- function(input) {
  if (input == 'y' || input == 'Y') {
    return('Yes')
  } else{
    return('no')
  }
}
ex5(ad)
ad <- scan(what="")
ad
# ##########
# 한줄로 리턴하기 이거는 다시하기
# 선생님꺼 R_lecture?였나? 들어가서 다시해보기


myid <- function(a,b,c) {
  D = b*b - 4*a*c
  if (abs(0)<1e-10) {
    return(1)
  } else if (D>0){
    return(2)
  } else{
    return(0)
  }
} 



a <- 1.000000001
b <- -2.0000000001
c <- 1.000000002
myid(a,b,c)
# '실수'를 0으로 비교하는 것은 어려운일이다.
# 정확한 0 으로
# 오차범위를 정한 후 같으면 같다고 표기한다
# 프로그램에선 if(x==y)가 아닌 
# if(abs(x-y)==1e-10)가 로 물어봐야한다
# ㅍ
