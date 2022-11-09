library(quantmod)
library(shiny)

ui <- fluidPage(
  titlePanel('Stock plots'),
  sidebarLayout(
    sidebarPanel(
      textInput('symbol', 'Symbol', 'GOOG'),
      dateRangeInput('dates', 'Date range', start='2022-01-01'),
      actionButton('action', 'refresh data', icon = icon('bacon'))
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Open', plotOutput('plotopen')),
        tabPanel('High', plotOutput('plothigh')),
        tabPanel('Low', plotOutput('plotlow')),
        tabPanel('Close', plotOutput('plotclose')),
        
      )
      # plotOutput('plotopen'),
      # plotOutput('plothigh'),
      # plotOutput('plotlow'),
      # plotOutput('plotclose'),
    )
  )
)

server <- function(input, output, session) {
  # stock_data = reactive(getSymbols(
  #   input$symbol,
  #   from=input$dates[1],
  #   to=input$dates[2],
  #   auto.assign = F
  # ))
  
  stock_data = eventReactive(
    input$action,
    getSymbols(
      input$symbol,
      from=input$dates[1],
      to=input$dates[2],
      auto.assign = F
    ))
  
  output$plotopen = renderPlot({
    plot(stock_data()[,1], main=paste(input$symbol, 'open'))
  })
  
  output$plothigh = renderPlot({
    plot(stock_data()[,2], main=paste(input$symbol, 'high'))
  })
  
  output$plotlow = renderPlot({
    plot(stock_data()[,3], main=paste(input$symbol, 'low'))
  })
  
  output$plotclose = renderPlot({
    plot(stock_data()[,4], main=paste(input$symbol, 'close'))
  })
}

shinyApp(ui, server)
