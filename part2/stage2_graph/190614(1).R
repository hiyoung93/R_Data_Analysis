getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage2_graph")

install.packages('ggiraphExtra')
install.packages('maps')
install.packages('mapproj')
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")

#오늘 배우는 library (ggiraphExtra, maps)
library(ggiraphExtra)
library(maps)
library(mapproj)
library(kormaps2014)
library(moonBook2)

library(gridExtra)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(reshape2)
library(tibble) #map데이터를 가져 오기 위해서 row에 이름을 붙여주기 위한 library
library(extrafont)
windowsFonts()
windowsFonts(NanumGothic = "NanumGothic")
theme_update(text = element_text(family = "NanumGothic"))

str(USArrests) # 강력범죄에 대해서 알려준다.
# str로 몇개의 데이터가 잇는지 알아본다
# head,tail로 어떻게 생겼는지 알아본다
# head(USArrests)앞이 '주'명 이구나
# summary(USArrests)로 boxplot에 대한 내용이 나온다. 이상치와 평균값을 알려준다.
# 처음 데이터를 보면 어떻게 생긴 데이터인지 알아본다.
# summary(USArrests)
# 

crime <- rownames_to_column(USArrests, var = 'state')
head(crime) #row에 있는 이름을 넣어주오라~
# map에서 data의 name은 소문자로 되어있기 떄문에 변경햐쥰다

crime$state <- tolower(crime$state)   #소문자 변경 함수(tolower)

state_map <- map_data('state')
str(state_map)



#단계구분도 만들기 ?? 왜 안되지?
ggChoropleth(data=crime,           # 지도에 표현하려는 데이터
             aes(fill=Murder,     # 색으로 표현할 변수    
                 map_id = state), #
             map = state_map)


ggChoropleth(data=crime,           # 지도에 표현하려는 데이터
             aes(fill=Murder,     # 색으로 표현할 변수    
                 map_id = state), #
             map = state_map, 
             interactive = T)




u <- ggChoropleth(data = crime,
                  aes(fill='Urban pop', map_id= state),
                  map = state_map)+
  ggtitle('미국 주별 도시비율 분포') +
  xlab('경도')+
  ylab('위도')+
  theme(plot.title = element_text(face='bold','hjust'=0.5,
                                  size = 15, color='darkblue'));u
                  
grid.arrange(m, r, a, u, col=2,
             top = '미국 주별 강력범죄 분포')
