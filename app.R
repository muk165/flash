library(shiny)
library(testthat)
library(usethis)

ui <- fluidPage(
  titlePanel("Calculate Sum"),
  sidebarLayout(
    sidebarPanel(
      numericInput("input1", "Input 1", value = 0),
      numericInput("input2", "Input 2", value = 0)
    ),
    mainPanel(
      verbatimTextOutput("output")
    )
  )
)

calculate_sum <- function(a, b) {
  return(a + b)
}

server <- function(input, output, session) {
  output$output <- renderPrint({
    result <- calculate_sum(input$input1, input$input2)
    result
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
