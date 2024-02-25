# fireworks <img src="./inst/images/fireworks.png" width="200px" align="right"/>

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Wrapper around the [fireworks-js](https://fireworks.js.org) lib that can be used in Shiny ✨,

## Installation

You can install the development version of `fireworks` from Github with:

``` r
pak::pak("hypebright/fireworks")
```

## Usage

You can add `fireworks` in the UI, or you can launch and stop fireworks from the server. Examples can be found in `/inst/examples`.

Calling `fireworks()` in the UI:

``` r
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

Launching and stopping fireworks from the server:

``` r
library(shiny)
library(fireworks)

ui <-
  fluidPage(
    titlePanel("Fireworks in Shiny!"),
    useFireworks(), # add dependencies
    actionButton("launch", "Launch fireworks"),
    actionButton("stop", "Stop fireworks")
  )
  
server <- function(input, output, session) {

  fw <- Fireworks$new()

  observe({
    fw$start()
  }) |> bindEvent(input$launch)

  observe({
    fw$stop()
  }) |> bindEvent(input$stop)

}

shinyApp(ui, server)
```
