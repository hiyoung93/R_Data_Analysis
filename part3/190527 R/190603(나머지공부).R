library(ggplot2)
library(dplyr)
mpg
View(mpg)
# #각각의 시내도로 연비평균
# mpg %>%
#   gruop_by(chevrolet, ford, honda)%>%
#   summarise_each(,cty)

#1.drv type (f,r,4)에 따른 평균속도()((cty+hwy)/2)?
mpg %>%
  mutate(avg_spd = )

#2. class에 따른 평균속도 -#sort 내림차순으로 다섯개만(head())
mpg %>%
  mutate(avg_spd = (cty+hwy)/2)%>%
  group_by(class)%>%
  summarise(클래스의평균 = mean(avg_spd))%>%
  arrange(desc(클래스의평균))%>%
  head(5)

mpg
#3. cyl에 따른 평균속도를 내림차순으로
####################
bbb ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
난 멍청이야 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
우우우ㅠ애애이ㅔㅇㅎㅁ냉럼ㄴㄹ야ㅏㅁ
########
#연비mpg를 배기량disp으로 나눠서 가장 좋은애 다섯개 
mtcars%>%
  mutate(md = (mpg / disp))%>%
  arrange(desc(md)) %>%
  head(5)


#cyl별 마력수의 평균 hp의 수?

mtcars%>%
  group_by(cyl)%>%
  summarise(avg_hp = mean(hp))%>%
  arrange(desc(avg_hp))


#cyl별 배기량과 마력의 평균
mtcars

mtcars%>%
  group_by(cyl)%>%
  summarise_each(list(mean),hp,disp)
  
mtcars%>%
  group_by(cyl)%>%
  summarise_each(funs(mean,n()),hp,disp)
  

#품종별 4가지 평균
iris%>%
  group_by(Species)%>%
  summarise_each(funs(mean))
  #list의 각각의 값과 funs의 값은 같다  
# iris%>%
#   group_by(Species)%>%
#   summarise_each(list(mean),Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
