# 변수~
#배열이 마지막에 나온다구? 그랬나,,?

#L-value(변수) = R-value (값) 이거시 일반적이지만 R은 그거슬 무시데스

val1 <- 'aaa' ; val1
val2 <- 111; var2
var3 <- Sys.Date(); var3
var4 <- c('a','b','c');var4 #'c'는 벡타라고 한다ㅏ

a <- 'o' 

222 <- var5 <-var6
var5; var6

var8 <-  var9 <- 222
var8; var9

string1 <- 'very Easy R Programming' ; string1
string2 <-  'Im James Seo' ; string2
string3 <- 'He said, \"I am single\".';string3

comp <- c(1, '2')
comp

class(comp)
#숫자로 부터 시작하는 변수는 읎다
#변수명은 이거시 무엇을 설명하는 것인가(의미를 알수 잇게)에 대해서 잘 지정을 해주어야한다
#그 단어의 영문명을 모르면 구글링~


num1 <- 1
num2 <- 2
num1 + num2

char1 <- 'a'
num1 + char1 #error 난다. 


seq1 <- 1:5 #range 같은거
seq1 
#넘나 쉬운 언어이지만 logic할떄는 오히려 괴롭's
seq2 <- 'a':'g' 
# 문자는 불가하다다

date1 <-seq(from=as.Date('2019-05-30'),to=as.Date('2019-08-09'),by=1);date1
class(date1)

date2 <-seq(from=as.Date('2019-05-30'),to=as.Date('2030-05-31'),by='month');date2

date3 <-seq(from=as.Date('2019-05-30'),to=as.Date('2020-08-09'),by='year');date3

objects()
.hidden <- 3 ;.hidden #보이지 않는 변수를 설정할때 '.'를 쓴다
rm(a) #변수를 지울수 있다(rm)
ls() #사용하고 있는 변수를 전부 보여준다~

rm(list = ls())
.hidden #은 rm사용해도 안지워짐 그래서 하나씩 지워야함
rm(.hidden)
