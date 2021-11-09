#install.packages("rdal")
#install.packages("leaflet")

library(rgdal) 
library(leaflet)

shp <- readOGR("shapes\\estados\\.", "BR_UF_2020", stringsAsFactors=FALSE, encoding="UTF-8")
dados <- read.csv(".\\geo\\estados.csv", encoding = "UTF-8")
score <- 1:27
dados <- cbind(dados, score)

brasileiropg <- merge(shp,dados, by.x = "ID", by.y = "CODIGO")
