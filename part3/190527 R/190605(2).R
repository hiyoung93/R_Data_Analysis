library(sqldf)
library(googleVis)
Fruits
sqldf("select gg._id, gg.name, gg.debut, s.title
      from girl_group AS gg
      inner join song as s
      ON gg._id = s.girl_group_id")

sqldf(c('update Fruits set Profit = 40 Where Fruit= \'Apples\' and Year=2008',
        'select * from Fruits'))
sqldf(c('delete from Fruits Where Fruit="Apples" and Year=2008',
        'select *from Fruits'))