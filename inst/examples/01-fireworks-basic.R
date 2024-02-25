library(shiny)
library(fireworks)

ui <-
  fluidPage(
    tags$head(tags$style(HTML("body {background-color: black}"))),
    tags$title("Fireworks 🎆"),
    tags$h2("Fireworks in Shiny!", style = "color: white; text-align: center;"),
    tags$div(
      fireworks(id = "myFirstFireworks")
    )
  )

server <- function(input, output) {}

shinyApp(ui, server)
