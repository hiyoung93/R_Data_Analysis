#정규 표현식
char <- c('apple','Apple','APPLE','banana','grape')
grep('apple',char)

char2 <- c('apple','banana')
grep(char2,char)

grep(paste(char2,collapse='|'),char,value=T)

char
grep('pp',char)

grep('pp',char,value=T)
grep('^A',char,value = T)
grep('e$',char,value = T)

char2 <- c('grape1','apple1','apple','orange','Apple')
grep('ap',char2,value = T)
grep('[1-9]',char2,value = T)
grep('[[:upper:]]',char,value = T)

char
nchar(char)
nchar('James Seo')
nchar('서진수')

paste('Kim','Sun','Woo')
paste('kim','sun','woo',sep="")
paste('kim','sum','woo',sep='0')
paste('i','\'m','Hungry')

substr('abc123',3,3)
substr('abc123',3,4)


#연습문제
s <- scan(what = '')
for(i in x)
  x <- s{
  print(paste(x,'번','학생','손드세요.'))}

s
