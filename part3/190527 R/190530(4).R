#Array
# Vector는 Array의 특수한 경우(1차원)


array1 <-  array(c(1:12),dim=c(4,3));array1 #col 우선이라서 아래로 내려간다

array1 <-  array(c(1:12),dim=c(4,3),byrow  =T);array#array는 byrow가 먹히지 안흔데

array2 <-  array(c(1:12),dim=c(2,2,3));array2 #array와 dim이 같아ㅑ지 생성된다
array2
array2[1,1,3]
array2[1,,]

#Array,vector,metrix는 datatype이 같다

# List는 any Data Type이다
#list는 어떠한 값을 주려면 값을 조회할수 있는 키값이 와야한다
# 키(key)= 값이 와야한다

list1 <- list(name='James Seo',
             address = 'Seoul',
             tel = '010-8706-4712',
             pay = 500)
list1

list1$name # '$'를 붙이고 값을 붙이면 나온다

#키값 밸륫쌍?(자바에서는 맵이라고 불린다.)
# 프로그램은 키값을 읽어서 벨류를 얻어 낸다
#python 의 dic과 비슷하다 = list
#각각의 datatype이 다른아이들을 넣을 수 있따
#이것이 바로 List~
#list에서는 index와 key값에서도 양쪽 모두 가지고 올수 있다.
#list에서는 추가 및 삭제가 매우 간편하다
list1$birtg <- '1719-10-23';list1
#새로운 키값을 넣어주면 추가가 된다.

list1$name <- c('Seojinsu','James Seo'); list1
# 이러한모든것을을 부르는 것은 objext라고 한다다

list1$birth <- NULL;list1
rm(list = ls())
ls()