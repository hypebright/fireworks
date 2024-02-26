library(shiny)
library(fireworks)

ui <-
  fluidPage(
    tags$title("Fireworks 🎆"),
    tags$h2("Fireworks in Shiny!"),
    useFireworks(),
    actionButton("launch", "Launch Fireworks"),
    plotOutput("plot", width = "100%", height = "400px"),
    br(),
    actionButton("launch2", "Launch Fireworks "),
    plotOutput("plot2", width = "100%", height = "600px")
  )

server <- function(input, output, session) {

  fw <- Fireworks$new(id = "plot",
                      options = list(hue = list(min = 0, max = 45),
                                     explosion = 10,
                                     traceSpeed = 5))

  fw2 <- Fireworks$new(id = "plot2",
                       options = list(hue = list(min = 0, max = 100),
                                      traceSpeed = 10))

  output$plot <- renderPlot({
    plot(cars)
  })

  output$plot2 <- renderPlot({
    plot(iris)
  })

  observe({
    fw$start()
    Sys.sleep(5)
    fw$stop()
  }) |> bindEvent(input$launch)

  observe({
    fw2$start()
    Sys.sleep(5)
    fw2$stop()
  }) |> bindEvent(input$launch2)

}

shinyApp(ui, server)
