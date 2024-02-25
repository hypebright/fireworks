library(shiny)
library(fireworks)

ui <-
  fluidPage(
    tags$head(tags$style(HTML("body {background-color: black}"))),
    tags$title("Fireworks 🎆"),
    tags$h2("Fireworks in Shiny!", style = "color: white; text-align: center;"),
    fireworks(id = "myFirstFireworks",
              options = list(hue = list(min = 0, max = 45),
                             explosion = 10,
                             traceSpeed = 5))
  )

server <- function(input, output) {}

shinyApp(ui, server)
