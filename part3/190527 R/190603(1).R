#옆으로 길면 힘들고, wide는 분석할때
#DF로 상관관계 분석, 그래프 그리려 할때는 long으로 필요하다
install.packages('googleVis')
inbrary(googleVis)
attach(Fruits)
install.packages('reshape2')
library(reshape2)
fruits 
melt(fruits,id = 'year')
melt(fruits, id =c('year','name'))
