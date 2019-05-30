Sys.Date()
Sys.time()
date()
class(Sys.Date())#캐릭터 ?
"2019-05-30"#이건 그냥 캐릭터
#문자일때는 못하고 데이터일때는 가능하다?
#type을 변경하자 무엇인가 변경할때는 는 as를 사용한다

as.Date()

class(Sys.Date())
class('2019-05-30')
class(as.Date('2019-05-30'))
as.Date('2019/05/30')
as.Date('01-11-2014')#미국식으로 표기했는데 서기 어쩌고 이상하게 나옴
as.Date('19-05-30')#이아이도 이상하게 표시되읐따
#내가 입력한걸 제대로된걸로 입력해주라~~
#그리하면 무엇인가를 추가's

as.Date('01-11-2014',format='%d-%m-%Y')#파이떤이랑 매우 비슷하군

ad.Date('19-05-30',format='%y-%m-%d')
#컴터로 할땐 되나?안되나라는 고민보다는 걍 손가락 운동하자ㅏㅏ
as.Date('190530',format='%y%m%d')

as.Date('2014년 11월 1일', format='%Y년 %m월 %d일')

as.Date('01112025',format='%d%m%Y')
#프로그램은 올해 돌려도 내년에 돌려도 같은 결과가 나와야 한다ㅏㅏ

as.Date(10,origin='2019-05-30')
as.Date(100,origin='2019-04-27')#써누랑 100일이래 >< 꺄ㅑㅑㅑ
#히히히히히히히히히히히히히히ㅣ히히히히히히히히히히히
#문자열만 가능
as.Date('2019-05-30') - as.Date('2019-05-27') #date타입이면 뺼수 잇는디 문자열이라서 못뺌
#긍데 as.Date를 붙이면 날짜로 변경되서 빼기가 가능's

as.Date('2019-11-14') - Sys.Date()
#나보다 수능이 더 늦게끝난다 그럼 서누랑 어케 놀지..?

as.Date(10,origin=Sys.Date())

as.POSIXct('2019-05-30 10:00:00') - as.POSIXct('2019-05-31 10:00:20')
0.491667*60
0.5002 * 60
as.Date(100,origin=Sys.Date)


install.packages('lubridate')#이거는 한번만하면되구
library(lubridate)#이거는 하나 할때마다 계속 불러야한다ㅏㅏ
now()
date  <- now()
date()
year(date)
month(date)
month(date, label = T)
day(date)
wday(date)
wday(date, label = T)
date <-  date - days(2); date
month(date) <-  2; date
date+ years(1); date
date+months(1);date
date <-  now()
date + months(3) #'-' 값은 먹히지가 안항여~ 왜 그런걸까여ㅛㅇ~? 의문은 품지 않는걸로 복잡해지니까ㅏ까>_<

date <-  hm('22:40');date
date <-  hms('22:40:12');date #'s'을 붙이고 초를 안쓰니까 먼말인지 몬알아 드러엉
# 날짜는 구글링해서 내 프로그램에 넣는게 속편한's
