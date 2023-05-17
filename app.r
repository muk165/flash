#### global.r contents
library(shiny)# life is dull without this
library(tidyverse)# makes things tidy
library(readxl) # to read source data file
library(shinydashboard) # for layout
library(leaflet) # for map
library(leaflet.providers) # to load OpenStreet Map
library(raster) # for map
library(sf) # for map

data <- read_excel("coal_data.xlsx")
# DATA TRANSFORMATIONS (data for the Bar Charts):
owner_avg <- data %>% group_by(`Coal Mine Owner Name`) %>% 
  summarise(production_permine = round(mean(`Coal/ Lignite Production (MT) (2019-2020)`),1)) %>% 
  arrange(desc(production_permine)) %>% slice(1:10)


dist_avg <- data %>% group_by(`District Name`) %>% 
  summarise(production_perdistrict = round(sum(`Coal/ Lignite Production (MT) (2019-2020)`),1))%>%
  arrange(desc(production_perdistrict)) %>% slice(1:10)

# DATA FOR THE MAP:
data2 <- data %>% dplyr::select(`State/UT Name`, `District Name`, `Coal/ Lignite Production (MT) (2019-2020)`) %>% 
  group_by(`State/UT Name`) %>%
  summarise(production_perstate = round(sum(`Coal/ Lignite Production (MT) (2019-2020)`),1))

data2 <- data2 %>% 
  mutate("NAME_1" = `State/UT Name`)

# DOWNLOAD MAP COORDINATES FROM GADM:  
IND_3 <- getData("GADM", country= "IND", level=1)
# Level 1 means States, Level 2 would be Districts

IND_1 <- merge(IND_3, data2,
               by.x = c("NAME_1"), by.y = c("NAME_1"),
               all.x = TRUE)

ind_2 <- IND_1[IND_1$NAME_1 %in% data2$`State/UT Name`, ]

# DEFINING COLOR PALETTE FOR MAP TILES. Using Black/grey color palette which correlates with color of coal
pal <- colorNumeric(
  palette = c("#e0e0e0", "#000000"),
  domain = ind_2$production_perstate) #Tiles would be colored based on production_perstate values

