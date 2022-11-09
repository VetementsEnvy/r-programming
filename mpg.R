library(shiny)

data('mpg', package = 'ggplot2')
fields = names(mpg)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h1('MPG'),
      selectInput('x', 'X', fields, selected='cty'),
      selectInput('y', 'Y', fields, selected='hwy'),
      numericInput('numrows', 'Number of rows', value = 5, step = 5)
    ),
    mainPanel(
      plotOutput('plot'),
      tableOutput('table')
    )
  )
)

server <- function(input, output, session) {
  output$plot = renderPlot(
    plot(mpg[,input$x], mpg[,input$y])
  )
  
  output$table = renderTable(
    head(mpg, input$numrows)
  )
}

shinyApp(ui, server)
