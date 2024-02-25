library(shiny)
library(fireworks)

ui <-
  fluidPage(
    tags$head(tags$style(HTML("body {background-color: black}"))),
    tags$title("Fireworks 🎆"),
    tags$h2("Fireworks in Shiny!", style = "color: white; text-align: center;"),
    useFireworks(),
    actionButton("launch", "Launch fireworks"),
    actionButton("stop", "Stop fireworks")
  )

server <- function(input, output, session) {

  fw <- Fireworks$new(options = list(hue = list(min = 0, max = 45),
                                     explosion = 10,
                                     traceSpeed = 5))

  observe({
    fw$start()
  }) |> bindEvent(input$launch)

  observe({
    fw$stop()
  }) |> bindEvent(input$stop)

}

shinyApp(ui, server)
