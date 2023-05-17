server <- function(input, output, session) 
  # Creating the Map:
{
  rv<- reactiveValues()
  
  observe({
    rv$owner_avg <- owner_avg
  })
  map = ind_2  %>%
    leaflet(options = leafletOptions(minZoom = 4.4, maxZoom = 4.4, zoomControl = FALSE)) %>%
    addProviderTiles(providers$CartoDB.PositronNoLabels) %>% setView( lat = 21.1458
                                                                      , lng = 79.0882
                                                                      , zoom = 4.4 )%>%
    addPolygons(weight = 1,
                stroke = TRUE,
                color = "grey",
                fillColor = ~pal(production_perstate),
                fillOpacity = 0.7,
                dashArray = "0.5",
                #popup = ~NAME_0,
                label = ~paste(NAME_1,
                               "<br/>",
                               "Coal Produced:", production_perstate, "MT")%>% lapply(htmltools::HTML),
                highlight = highlightOptions(
                  weight = 2,
                  dashArray = "",
                  color = "black",
                  bringToFront = TRUE
                )) %>% 
    addCircleMarkers(data = data,
                     lat = ~Latitude,
                     lng = ~Longitude,
                     weight = 0.5,
                     radius = 5)
  #setView(-93.65, 42.0285, zoom = 17)
  output$myMap = renderLeaflet(map)
  # Creating Bar Charts:
  output$bar1<-renderPlot(
    ggplot(rv$owner_avg, aes(x = production_permine, y = reorder(`Coal Mine Owner Name`, production_permine) ), )+
      geom_bar(stat = "identity", width = 0.7, fill ="black")+
      geom_text(aes(label=production_permine), hjust=-0.20, size=3.5)+ 
      theme_minimal(base_size = 15)+ labs(x = " ", y = "")+ 
      labs(subtitle = "COAL PRODUCED PER MINE")
    
  )
  output$bar2<-renderPlot(
    ggplot(dist_avg, aes(x = production_perdistrict, y = reorder(`District Name`, production_perdistrict) ), )+
      geom_bar(stat = "identity", width = 0.7, fill ="black", name="District_Name")+
      geom_text(aes(label=production_perdistrict), hjust=-0.1, size=3.5)+ 
      theme_minimal(base_size = 15)+ 
      labs(x = " ", y = "")
    
  )
  
  
  
  observe(
    {  click = input$myMap_shape_click
    browser()
    if(is.null(click))
      return()
    else
      leafletProxy("mymap") %>%
      setView(lng = click$lng , lat = click$lat, zoom = 6)
    
    
    }
  )
  
  
  
  
}