#벡터를 하나씩 쌓으면 그게 DataFrame이 된다

No <-  c(1:4)

Name <- c('Apple','Peach','Banan','Grape')
Price <- c(500,200,100,50)
Qty <- c(5,2,4,7)

sales <- data.frame(NO=No,NAME=Name,PRICE=Price, QTY = Qty)
sales

sale2 <- matrix(c(1,'Apple',500,5,
                  2,'Peach',200,2,
                  3,'Banan',100,4,
                  4,'Grape',50,7),nrow = 4, byrow = T); sale2

df1 <- data.frame(sales2)
df1


names(df1) <- c('No','NAME','PRICE','QTY');df1

sales
sales$NAME #벡터로 변경되었다

sales[1,3]
sales[,3]
sales$PRICE
sales[1,]
sales[c(1,2),]
sales[,c(1,2)]
sales[,c(1:3)]
#DataFrame은 한눈에 보이고 

subset(sales,QTY<5)
subset(sales,PRICE==500)#거의 대부분의 languse에서 비교할땐 '='을 두개 사용~
#500이 아닌 놈 찾기
subset(sales,PRICE!=500)#아닌거 틀린거를 찾을때는 !=으로 해야한다
#subset(sales,NAME='Grape')#문자는 꼭 ''을 사용해야한다
subset(sales,NAME=='Grape')

no <- c(1:3)
name <- c('apple','banana','peach')
price <- c(100,200,300)
df1 <- data.frame(NO=no,NAME=name,PRICE=price); df1

no <- c(10,20,30)
name <- c('train','car','airplane')
price <- c(1000,2000,3000)
df2 <- data.frame(NO=no, NAME=name, PRICE=price);df2

df3 <-cbind(df1,df2);df3
df3$NAME#앞에있는 과일만
df3[,5]#뒤에있는 탈것들만

df4 <- rbind(df1,df2);df4

df5 <- data.frame(name=c('apple','banana','cherry'), price=c(300,200,100));df5
df6 <- data.frame(name=c('apple','cherry','berry'), qty=c(10,20,30));df6

merge(df5,df6)#Inner Join : (SQL)에서 사용되는 것들 같은 값을 추출하고 필요한것들만 추출한다(교집합'st)

merge(df5,df6,all = T)#Outer Join : 있거나 말거나 그냥 다 보여주라!(합집합'st)

rbind(df5,df6) #이름이 맞지 않아서 안된다 name do not Error

cbind(df5,df6) 
cbind(df6,df5) 


new <-  data.frame(name='mango',price=400)
df5 <- rbind(df5,new);df5
df5 <- rbind(df5, data.frame(name='berry',price=500));df5
#일시적으로 사용하는 변수들은 내코드를 간결하게 만들어준다
#굳이 컴터에 저장은 하지않아도된다/

df5 = cbind(df5,data.frame(quantile=c(10,20,30,40,50))); df5


no <- c(1:5)
name <-  c('서진수','주시현','최경우','이동근','윤정웅')
address <- c('서울','대전','포항','경주','경기')
tel <- c(1111,2222,3333,4444,5555)
hobby <- c('독서','미술','놀고먹기','먹고놀기','노는애감시하기')
member <- data.frame(NO=no,NAME=name,ADDRESS=address,TEL=tel,HOBBY=hobby);member

member2 <- subset(member, select = c(NO,NAME,TEL)) ;
member2

member3 <- subset(member, select= - TEL);member3

colnames(member3) <- c('번호','이름','주소','취미');member3

sales
ncol(sales)
nrow(sales)
names(sales)

rownames(sales) <- c('one','two','three','four')
sales
sales[c(2,3,1),]
sales[,c(1,2,4,3)]#보는 순서를 변경가능하다.

