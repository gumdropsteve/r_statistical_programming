library(shiny)

ui <- fluidPage(
  sliderInput(inputId="num", label="Choose a Number", value=25, min=1, max=100),
  plotOutput("hist"),
  sliderInput(inputId="num2", label="Choose a Number", value=500, min=1, max=1000),
  plotOutput("hist2")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    title <- "Histogram 1"
    hist(rnorm(input$num), main=title)
  })
  output$hist2 <- renderPlot({
    title <- "Histogram 2"
    hist(rnorm(input$num2), main=title)
  })
  
}

shinyApp(ui = ui, server = server)