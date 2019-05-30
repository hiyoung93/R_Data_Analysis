getwd()
txt1 <- read.csv('factor_test.txt');txt1
factor1 <- factor(txt1$blood) ;factor1
summary(factor1)#가지고 있는 같은 값의 갯수를 알려준다
sex1 <- factor(txt1$sex)
summary(sex1)
