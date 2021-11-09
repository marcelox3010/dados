
library(rgdal) 

shp <- readOGR("shapes\\estados\\.", "BR_UF_2020", stringsAsFactors=FALSE, encoding="UTF-8")
dados <- read.csv(".\\geo\\estados.csv", encoding = "UTF-8")


