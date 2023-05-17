library("shiny")
library("shinydashboard")
library("leaflet")
library("riskyr")
library(spData)
data(us_states)
us_states <- us_states 
# Add lat/long
library(dplyr)
library(sf)
us_geom <- as.data.frame(us_states %>% st_coordinates()) %>%
  group_by(L3) %>%
  summarise(lat = mean(Y), long = mean(X))
us_states$lat <- us_geom$lat
us_states$long <- us_geom$long
us_states$REGION <- as.character(us_states$REGION)
us_states$NAME <- as.character(us_states$NAME)
us_states2 <- as_Spatial(us_states)
us_states2 <- as.data.frame(us_states2@data)

# Add pallette for leaflet
pal <- colorBin("RdYlBu", domain = c(0,1000000), bins = 12, reverse = 
                  TRUE)

ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "Dashboard"),
  dashboardSidebar(
    selectInput('select_region', 'Region: ', choices = 
                  unique(as.character(us_states$REGION))),
    uiOutput("select_state"),
    actionButton("update_view", "update_view")
  ),
  dashboardBody(
    fluidRow(column(width = 12, leafletOutput(outputId = "mymap")))
  )
  
)

server <- function(input, output, session) {
  
  output$select_state <- renderUI({
    selectInput("User1", "State: ", choices = 
                  as.character(us_states2[us_states2$REGION==input$select_region,
                                          "NAME"]))
  })
  
  
  data_input <- reactive({
    us_states  %>% 
      dplyr::filter(REGION == input$select_region &
                      NAME == input$User1 ) 
  })
  
  data_input2 <- reactive({
    us_states2  %>% 
      dplyr::filter(REGION == input$select_region &
                      NAME == input$User1 ) 
  })
  
  
  output$mymap <- renderLeaflet({
    leaflet(us_states) %>%
      addTiles() %>%
      addPolygons(
        fillColor = ~pal(total_pop_10)) }) 
  
  
  observeEvent(input$update_view, {
    
    leafletProxy("mymap", session)   %>%
      setView(
        lng = as.numeric(data_input2() %>% select(long)),
        lat = as.numeric(data_input2() %>% select(lat)),
        zoom = 7  )
  })
  
  
}

shinyApp(ui, server)