#Function
mat1 <-  matrix(C(1:6), nrow = 2, byrow = T)
mat1
a <- rep(1,3)
sweep(mat1,2,a)
b <- matrix(c(2,2))
sweep(mat1,1,b)

a <- c(1:5); length(a)
length(mat1)
library(googleVis)
length(Fruits)

log(10)
log10(10)
sin(pi)
abs(1)
v2 <- c(1,-2,3,-4)
abs(v2)

ceiling(2.3)
floor(2.3)
ceiling(-2.3)
floor(-2.3)
round(2.5)
round(2.51)
?round()

choose(5, 3)


#전해줄 값이 없으면 {}을 열면 Rstudio가 알아서 열어줌

myfunc <- function() {
  return(10)
}

myfunc()
myfunc2 <- function(x) {
  y = x + x;
  return(y)
}
myfunc2(-3)


#연습문제 P.401

#1
func_test1 <- function(a,b) {
  c <- a - b
  return(c)
}
func_test1(3,2)
func_test1(2,3)
#2
func_test2 <- function(a,b) {
  c <- a - b
  return(abs(c))
}
func_test2(3,2) 
func_test2(2,3)

#쌤 답 - 2번은 소수점에서 문제가 생길수 있따.
func_test3 <- function(a,b) {
  result <- abs(exfunc1(a,b))
  return(result)
}