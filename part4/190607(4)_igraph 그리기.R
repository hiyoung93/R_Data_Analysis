
library(igraph)
install.packages(antialias)
library(antialias)
library(devtools)

g1 <- graph(c(1,2, 3,4, 2,4, 5,4, 2,2, 4,5))
plot(g1)
str(g1)

png(filename = "Rplot%03d.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"), antialias)


plot(g,layout=layout.fruchterman.reingold,vertex.size=8,edge.arrow.size=0.5,family="AppleGothic")

name <- c('서진수 대표이사','일지매 부장','김유신과장','손흥민대리','노정호대리','이순신부장','유관순과장','신사임당 사장','강감찬 장군','광개토 대왕','정몽수 사상')
pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신과장','노정호대리','이순신부장','유관순과장','신사임당 사장','서진수 대표이사사','이순신부장','유관순과장')
emp <- data.frame(이름=name,상사이름=pemp)
emp
g <- graph.data.frame(emp,directed = T)
plot(g,layout=layout.fruchterman.reingold,vertax.size=8,edge.arrow.size=0.5)
str(g)
png('network_3.png',width = 600,height = 600)

g3 <- graph.data.frame(emp,directed = F)
plot(g3,layout=layout.fruchterman.reingold,vertex.size=8,
     edge.arrow.size=0.5,vertex.label=NA)
png('network_5.png',width=600,height=600)



install.packages('devtools')
library(devtools)
install.packages("d3Network")
library(d3Network)
install_github('christophegandrud/3dNetwork')

name <- c('Angela Basset','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
          'Whoopi goldberg','Emma Thompson','Julia Roberts','Angela Bassett',
          'Susan Sarandon','Nicole Kidman')
pemp <- c('Angela Basset','Winona Ryder','Jessica Lange','Whoopi goldberg',
          'Whoopi goldberg','Emma Thompson','Julia Roberts','Angela Bassett',
          'Meryl Streep','Susan Sarandon')
emp <- data.frame(이름=name,상사이름=pemp)
d3SimpleNetwork(emp,width = 600,height = 600,
                file ='D:/workspace/R_Data_Analysis/part4/data/d3.html')


g <- read.csv('군집분석.csv',head=T)
graph <- data.frame(학생=g$학생,교수=g$교수)
g <- graph.data.frame(graph,directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=2,edge.arrow.size=0.5,
     vertex.color='green',vertex.label=NA)

plot(g,layout=layout.kamada.kawai,vertex.size=1,edge.arrow.size=0.5,
    vertex.label=NA)#vertex.color의 기본은 주황색이다.#layout어떤게 있는지 알아보기


g <- read.csv('군집분석.csv',head=T)
graph <- data.frame(학생=g$학생,교수=g$교수)

g <- graph.data.frame(graph,directed=T)
g

#색상,크기 구분해서 출력하기
V(g)$name
gubun1 <- V(g)&name
gubun1
gubun1 <- str_sub(gubun1,start=1,end=1)
subset(V(g)&name,gubun1) 

R.version
