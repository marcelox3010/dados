
library(rgdal) 
library(leaflet)

shp <- readOGR("shapes\\estados\\.", "BR_UF_2020", stringsAsFactors=FALSE, encoding="UTF-8")
dados <- read.csv(".\\geo\\estados.csv", encoding = "UTF-8")
score <- 1:27
dados <- cbind(dados, score)

brasileiropg <- merge(shp,dados, by.x = "CD_UF", by.y = "CODIGO")

proj4string(brasileiropg) <- CRS("+proj=longlat +datum=WGS84 +no_defs")

Encoding(brasileiropg$NM_UF) <- "UTF-8"

brasileiropg$Score[is.na(brasileiropg$score)] <- 0

pal <- colorBin("Blues",domain = NULL,n=5) #cores do mapa

state_popup <- paste0("<strong>Estado: </strong>", 
                      brasileiropg$NM_UF, 
                      "<br><strong>Pontos: </strong>", 
                      brasileiropg$score)

leaflet(data = brasileiropg) %>%
  
  addProviderTiles("CartoDB.Positron") %>%
  
  addPolygons(fillColor = ~pal(brasileiropg$score), 
              fillOpacity = 0.8, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = state_popup) %>%
  
  addLegend("bottomright", pal = pal, values = ~brasileiropg$score,
            title = "Pontos Conquistados",
            opacity = 1)
