library(shiny)

plot_normal_dist = function(n, mu, sd, title){
  hist(rnorm(n, mu, sd), 100, main = title)
}


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      'normal distribution',
      textInput(inputId = 'title', label='Title of plot', value = 'Hist'),
      sliderInput('mu', 'Mu', -50, 50, value = 0),
      sliderInput('sd', 'SD', 0, 100, value = 0)
    ),
    mainPanel(
      plotOutput(outputId = 'plot'),
      verbatimTextOutput(outputId = 'text')
      
    )
  )
)

server <- function(input, output, session) {
  output$plot = renderPlot(
    plot_normal_dist(1000, mu=input$mu, input$sd, input$title)
    )
  
  output$text = renderPrint(
    input$title
  )
  
}

shinyApp(ui, server)
