install.packages('shiny')
library(shiny)
getwd()



library(shiny)
install.packages(shinythemes)
library(shinythemes)

ui <- fluidPage(
  theme=shinytheme('superhero'),
  titlePanel('title of my dashboard'),
  sidebarLayout(
    sidebarPanel(
      "side bar"
    ),
    mainPanel(
      "main"
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)

