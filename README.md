# Adding fireworks to Shiny 🎆

Wrapper around the [fireworks-js](https://fireworks.js.org) lib that can be used in Shiny ✨ 

## Installation

You can install the development version of `fireworks` from Github with:

```
pak::pak("hypebright/fireworks")
```

## Usage

Simple demo of using the `fireworks()` function:

```
library(shiny)
library(fireworks)

ui <-
  fluidPage(
    titlePanel("Fireworks in Shiny!"),
    mainPanel(
      fireworks()
    )
  )

server <- function(input, output) {}

shinyApp(ui, server)
```
