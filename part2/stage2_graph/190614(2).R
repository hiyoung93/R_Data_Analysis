# 대한민국 시도별 인구 단계 구분도 만들기

getwd()
setwd("D:/workspace/R_Data_Analysis/part2/stage2_graph")

install.packages('stringi')
installed.packages('devtools')
devtools::install_github("cardiomoon/kormaps2014")

library(ggiraphExtra)
library(ggplot2)

library(kormaps2014)
library(extrafont)
library(ggplot2)
library(ggthemes)
library(dplyr)
windowsFonts()
windowsFonts(NanumGothic = "NanumGothic")
theme_update(text = element_text(family = "NanumGothic"))



str(changeCode(korpop1))

korpop1 <- rename(korpop1, 
                pop = 총인구_명,
               name = 행정구역별_읍면동)


str(changeCode(korpop1))
head(changeCode(korpop1))

ggChoropleth(data = korpop1,           # 표시하려는 자료
             aes(fill = pop,           # 표시하려는 데이터
                 map_id = code,        # 지도의 코드 기준 변수
                 tooltip = name),      # 이름 표시되는 지역명
             map = kormap1,            # 표시되는 지도의 모양 지도 데이터
             interactive = T)          # 인터렉티브
        
        

# 결핵환자수 단계 구분도 만들기
str(changeCode(tbc))

ggChoropleth(data = tbc,               # 표시하려는 자료
             aes(fill = NewPts,        # 표시하려는 데이터
                 map_id = code,        # 지도의 코드 기준 변수
                 tooltip = name),      # 이름 표시되는 지역명
             map = kormap3,            # 표시되는 지도의 모양 지도 데이터
             interactive = T)       
# 데이터에 str을 보고 $ 을 잘 만들어주자  