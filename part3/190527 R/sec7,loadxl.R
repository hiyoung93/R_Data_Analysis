#어디선가 데이터를 가지고와야한다. 갱장히 당양항방벙잉잉따
#Load and Save Data
list.files()
#recursive 하위데이터까지 전부 지워줘! rm-rf의 rf쪽 r
scan1 <- scan('scan_1.txt'); scan1

scan2 <- scan('scan_2.txt'); scan2 #실수(str)로 저장되었는데, 정수(int)로 나온다, 그래서  option을 설정해야한다.
scan2 <- scan('scan_2.txt',what=''); scan2 #문자열로 표시된다 what
scan3 <- scan('scan_3.txt',what=''); scan3
scan4 <- scan('scan_4.txt',what=''); scan4


#########
input <- scan()#이거는 숫자만 입력하기!
input

input1 <- scan(what='')
input1
#readline()함수를 한줄 읽어줘!
input3 <- readline()
input3
input4 <- readline('Are you ok? :')
input4
input5<- readLines('scan_4.txt')# Line 대문자 조심's
input5


fruits <- read.table('fruits.txt')

############
fruits <- read.table('fruits.txt')
fruits
fruits <- read.table('fruits.txt',header=T); fruits
fruits2 <- read.table('fruits_2.txt',skip=2); fruits2
fruits2 <- read.table('fruits.txt',nrows=2); fruits2
fruits3 <- read.table('fruits.txt',header=T,nrows=2); fruits2

fruits3 <- read.csv('fruits_3.csv'); fruits3
#csv는 header를 인식하지만 
#text는 header를 지정해주어야한다.
fruits4 <- read.csv('fruits_4.csv',header = F); fruits4 #헤더가 없다고 알려줘야 인식을 하고 v1,2,3,로 알아서 지정해준다!

label <- c('NO','NAME','PRICE','QTY')
fruits4 <- read.csv('fruits_4.csv',header = F,col.names = label); fruits4

install.packages('googleVis')
library(googleVis)
install.packages('sqldf')
library(sqldf)
Fruits
#어떠한 데이터를 가지고올때 전부가지고올라면 sqldf를 사용한다
#select *from = DB.table

write.csv(Fruits,'Fruits_sql.csv',quote=F,row.names=F)
fruits_2 <- read.csv.sql('Fruits_sql.csv',
                         sql='SELECT * FROM file WHERE Year = 2008')
fruits_2


##########################
#알을 사용하면서 패키지가 만오천개가 있다
# 어떠한 패키지에서만 하는게아니라 여러방법으로 할수있따
# 어느순간이되면 나의 주특기를 만드러야한다.
# 여러 좋은 소스코드가 많으니까 구글링을 잘해보자



install.packages('XLConnect')
library(XLConnect)

data1 = loadWorkbook('fruits_6.xls',create=T)

data2 = readWorksheet(data1,sheet='sheet1',
                      startRow = 1,
                      endRow = 8,
                      startCol = 1,
                      endCol = 5)
data2
##이거 이해안됨 물어보기
fruits6 <- read.delim('clipboard',header = T)
fruits6

install.packages('readxl')
library(readxl)
# importing excel file by using read_excel() function
# importing excel file by using read_excel() function

fruits7 <- read_excel('fruits_6.xls',sheet = , # sheet name to read from
                            range = "B3:E8", # cell range to read from
                           col_names = TRUE, # TRUE to use the first row as column names
                           col_types = "guess", # guess the types of columns
                           na = "NA") # Character vector of strings to use for missing values

