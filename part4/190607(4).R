

name <- c('서진수 대표이사','일지매 부장','김유신과장','손흥민대리','노정호대리','이순신부장','유관순과장','신사임당 사장','강감찬 장군','광개토 대왕','정몽수 사상')
pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신과장','노정호대리','이순신부장','유관순과장','신사임당 사장','서진수 대표이사사','이순신부장','유관순과장')
emp <- data.frame(이름=name,상사이름=pemp)
emp
g <- graph.data.frame(emp,directed = T)
plot(g,layout=layout.fruchterman.reingold,vertax.size=8,edge.arrow.size=0.5)
str(g)
png('network_3.png',type='png',width = 600,height = 600)

g3