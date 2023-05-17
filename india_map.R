# # Install required packages
# install.packages("leaflet")

# Load required libraries
library(leaflet)
library(maps)
library(geojsonio)
# Create a leaflet map
# Install required packages
#install.packages(c("leaflet", "geojsonio"))

# Load required libraries
library(leaflet)
library(geojsonio)

# Fetch geojson data for India
india_geojson <- geojson_read("https://raw.githubusercontent.com/geohacker/india/master/state/india_telengana.geojson", what = "sp")

# Create a leaflet map
map <- leaflet(data = india_geojson) %>%
  addTiles() %>%
  setView(lng = 78.9629, lat = 20.5937, zoom = 5)  # Set initial map view to India

# Add the India geojson data as polygons
map <- map %>%
  addPolygons(
    fillColor = "#ffffcc",
    color = "#000000",
    weight = 1,
    fillOpacity = 0.7
  )


## R Shiny ui code begins here
ui <- bootstrapPage(
  tags$style(type = "text/css", "html, 
             body {width:100%;height:100%}"),
  leafletOutput("mymap", width= "100%", height = "100%"),
  
  # Absolute panel will house the user input widgets
  # Div tag is used to add styling to absolute panel
  absolutePanel(top = 10, right = 10, fixed = TRUE,
                tags$div(style = "opacity: 0.70; background: #FFFFEE; padding: 8px; ", 
                         helpText("Welcome to the World map")
                )
  )
)

## End of ui code


## R Shiny server code begins here
server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    # Create the map data and add ploygons to it
    map <- map %>%
      addPolygons(
        fillColor = "#ffffcc",
        color = "#000000",
        weight = 1,
        fillOpacity = 0.7
      )
    
  })
  
  # Zoom and set the view after click on state shape
  # input$mymap_shape_click will be NULL when not clicked initially to any shape
  # input$mymap_shape_click will have the ID, lat and lng corresponding to the shape clicked
  observe(
    {  click = input$mymap_shape_click
    if(is.null(click))
      return()
    else
      leafletProxy("mymap") %>%
      setView(lng = click$lng , lat = click$lat, zoom = 7)
    
    }
  )
  
}

shinyApp(ui, server)
