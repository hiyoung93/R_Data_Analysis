c(1,2,3,4,5)
c(1,2,3,4,'5')
# 하나의 변수에 담아서 관리하자 
vec1 <-  c(1,2,3,4,5)
vec1
vec1[3]
# 3번쨰 있는 애를 읽어우줒줒 index라고 한다!
#근데 R은 index를 다르게 읽는다 파이썬이랑 쪼큼 다름
# 0 = 1이고 1 = 1이다 

vec1[-3] #파이썬은 -1은 오른쪽맨끝 근데 R은 ?기억안ㄴ...

vec1[1:3]
length(vec1)
vec1[1:(length(vec1)-2)]#괄호처리를 안하면 에러 값은 원하는 값끼리 묶어줘야한다~

#ex)반복문을 돌릴때 length을 돌리면 내가 원하는 길이를 알수 있따.
#length함수는 벡터의 길이, dataframe의 열의 개수를 셀 때 사용하는 함수입니다.

vec1[length(vec1)]
#[]안에 숫자가 나오는건 일반적이지 않으니까 식이 나오면 ?
# 뭐라는거지 ㅜㅜㅜㅜ 
vec1[-1:-3]
vec1[2:4]


vec1[2] <- 6; vec1 #2번에 '6'을 넣어라~

# 어떠한 변수가 있을때 왼쪽에 있으면 변수를 넣어라
# 오른쪽은 변수에 이걸 넣어라~\

vec1 <-  c(vec1, 7); vec1 #그 다음값은 이걸 넣어줘~ 오른쪽을 조회한다음에 왼쪽에 넣어주

vec1[7] <- 8; vec1
vec1[9] <-  9 ;vec1 #8번째 값을 주지 않았기 떄문에 8번은 Na가 난다 

# 함수사용!

append(vec1,10,after=3) #여기서 atfer=3은 값이 아니라 index이다!
append(vec1,c(10,11),after=3) #c를 붙이지 않으면 error남


vec1 <- append(vec1,c(10,11),after=3); vec1

append(vec1, 100, after=0) #after=0은 맨 앞에다가 넣어라!

##백터 연산하기
c(1,2,3) + c(4,5,6)

c(1,2,3) + 1 #오른쪽 1은 스칼라(?)값이라고 불린다

var1 <-  c(1,2,3)
var2 <-  c(3,4,5)
var1 + var2
var3 <-  c('3','4',5); var3
var1 +var3

union(var1,var3) #합집합개냠 같은값은 사라지고 다른값만 생성's datatype이 다를 경우 'union'을 사용해야한다

var4 <- c(1,2,3,4,5)
var1;var4 


var1 + var4 #결과는 보여줄꺼야 근데 너 이러면 진짜 '큰일난다!'
#값이 작인애들이 큰애들의 뒤로 간다 그후에 결과값이 나온다
var5 <- c(1,2,3,4,5,6)
var1+var5
# 갯수가 작으면 뭐라고 하고 안작으면 뭐라고 안함
# 둘이 길이가 다르면 순환원리가 작용된다!

var1 - var2  

# #vector는 집합이고 
# 집합에는 union
# 교집합 intersect
# 차집합 


setdiff(var1, var2)
setdiff(var2, var1)

intersect(var1, var2)

fruits <- c(10,20,30); fruits
names(fruits) <- c('apple','banana','mango');fruits 
#pandas의 serise(?)형태가 된다!
var5 <- seq(1:6); var5 #프로그램을 좀 하는구나
#66처럼 하면 먼가 노가다'st

var6 <-  seq(2, -2); var6 #python에서랑 다름  뒤에 
# 시작값 < 끝값 = +1
#        >      = -1
# 이것이 default값 

even <- seq(2, 10 ,2); even
odd <-  seq(1,10,2);odd
# (시작, 끝, step(증분))
var8 <- rep(1:3,2); var8
var9 <- rep(1:3, each=2); var9 #프린트할때 한부씩? 두부씩? 어케할꼬? 비슷한거(rep = repeat)
  #반복적인 데이터를 생성하는 함수~

##벡터의 길이를 찾자!

length(var1)
NROW(fruits)#2차원할때 사용하는 함수

# bool 함수
5 %in% even
4 %in% even


