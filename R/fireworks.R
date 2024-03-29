#' Add fireworks dependencies
#'
#' @importFrom htmltools withTags
#' @return A tagList with the fireworks dependencies
#' @export

useFireworks <- function() {

  fireworksTag <- withTags(
    div(class = "fireworksDeps")
  )

  add_fireworks_deps(fireworksTag)

}

#' Add fireworks div
#'
#' @param id The id of the fireworks div
#' @param options A list of options to pass to the fireworks
#' @param width,height The width and height of the fireworks, either in pixels (e.g. '100px') or percent (e.g. '100%')
#' @importFrom jsonlite toJSON
#' @importFrom htmltools withTags
#' @export

fireworks <- function(id, width = "100%", height = "400px", options = list()) {

  fireworksTag <- withTags(
    div(id = id,
        style = sprintf("width: %s; height: %s;", width, height),
        class = "fireworks",
        script(
          sprintf(
            "$(document).ready(function() {
                const container = document.getElementById('%s')
                const fireworks = new Fireworks.default(container, %s)
                fireworks.start()
              });",
            id,
            jsonlite::toJSON(options, auto_unbox = TRUE)
          )
        ))
  )

  add_fireworks_deps(fireworksTag)

}

#' Fireworks R6 Class
#'
#' Create fireworks and start or stop the fireworks.
#'
#' @details
#' Create an object to show fireworks as an overlay on the app
#' or a specific HTML element specified by \code{id}. Then \code{start},
#' the fireworks show, and \code{stop} the fireworks show.
#'
#' @name fireworksClass
#' @import R6
#' @export
Fireworks <- R6::R6Class(
  "Fireworks",
  public = list(
    #' @details
    #' Create fireworks.
    #'
    #' @param id Id, or vector of ids, of element on which to display the fireworks, if \code{NULL} the fireworks show
    #' will be an overlay on the full HTML document.
    #' @param session The Shiny session
    #' @param options A list of options to pass to the fireworks
    #' @importFrom shiny getDefaultReactiveDomain
    #' @examples
    #' \dontrun{Fireworks$new()}
    initialize = function(id = NULL, session = shiny::getDefaultReactiveDomain(), options = list()){
      private$.id <- id
      private$.session <- session
      private$.options <- options
    },
    #' @details
    #' Start fireworks.
    start = function(){
      if (is.null(private$.id)) {
        private$.session$sendCustomMessage("fireworks-start", list(options = private$.options))
      } else {
        for (i in 1:length(private$.id)) {
          msg <- list(
            id = private$.id[[i]],
            options = private$.options
          )
          private$.session$sendCustomMessage("fireworks-start", msg)
        }
      }
      invisible(self)
    },
    #' @details
    #' Stop the fireworks
    #' @param fadeOut Whether to fade out the fireworks before stopping. Note that
    #' this will take 2000ms to complete.
    stop = function(fadeOut = FALSE){
      if (is.null(private$.id)) {
        private$.session$sendCustomMessage("fireworks-stop", list(fadeOut = fadeOut))
      } else {
        for (i in 1:length(private$.id)) {
          private$.session$sendCustomMessage("fireworks-stop", list(id = private$.id[[i]],
                                                                    fadeOut = fadeOut))
        }
      }
      invisible(self)
    }
  ),
  private = list(
    .id = NULL,
    .session = NULL,
    .options = NULL
  )
)
