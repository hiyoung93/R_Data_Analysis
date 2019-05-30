#vector는 datatype은 한가지밖에 못가진다

#행의 갯수가 몇개인지 알려주야한다

mat1 <- matrix(c(1,2,3,4))
mat1 #4/1으로 됨

mat2 <- matrix(c(1,2,3,4),nrow=2);mat2

mat3 <- matrix(c(1,2,3,4),nrow=2, byrow = T);mat3  
#컴터는 선택장애되면 전나 힘들다
#어떤순서로 어케할껀지 세세하게 알려주어야한다.
#wed화면을 하나 만들기 위해서 어마어마한것이가 들어간다

mat3[1, 1]
mat3[1,]#행전체
mat3[,1]#열전체

mat4 <- matrix(c(1,2,3
                 ,4,5,6
                 ,7,8,9),nrow = 3, byrow = T);mat4
#고급단계 <
mat4 <- matrix(seq(1:9),nrow = 3, byrow = T);mat4

mat4 <- rbind(mat4, c(10:12));mat4 #행추가
mat4 <- cbind(mat4, c(13:16));mat4 #열추가

mat5 <-  matrix(c('a','b','c','d'),nrow=2, byrow=T)
mat5 <- cbind(mat5,c('e','f')); mat5

colnames(mat5) <- c('First','Second','Third')
mat5

##연습문제

seasons <- matrix(c('봄','여름','가을','겨울'),nrow = 2); seasons#1-(1)
seasons <- matrix(c('봄','여름','가을','겨울'),nrow = 2,byrow = T); seasons#1-(2)
seasons[,2]#2
seasons1 <- rbind(seasons,c('초봄','초가을'));seasons1#3
seasons2 <- cbind(seasons1,c('초여름','초가을','초겨울'));seasons2#4
