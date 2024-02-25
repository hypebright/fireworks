#' Add fireworks dependencies
#'
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
#' @param ... Additional arguments to pass to the fireworks function
#' @export

fireworks <- function(id, ...) {

  fireworksTag <- withTags(
    div(id = id,
        class = "fireworks",
        script(
          sprintf(
            "$(document).ready(function() {
                const container = document.getElementById('%s')
                const fireworks = new Fireworks.default(container, {})
                fireworks.start()
              });",
            id
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
  "fireworks",
  public = list(
    #' @details
    #' Create fireworks.
    #'
    #' @param id Id, or vector of ids, of element on which to display the fireworks, if \code{NULL} the fireworks show
    #' will be an overlay on the full HTML document.
    #' @param session The Shiny session
    #' @examples
    #' \dontrun{Fireworks$new()}
    initialize = function(id = NULL, session = shiny::getDefaultReactiveDomain()){
      private$.id <- id
      private$.session <- session
    },
    #' @details
    #' Start fireworks.
    start = function(){
      if (is.null(private$.id)) {
        private$.session$sendCustomMessage("fireworks-start", list())
      } else {
        for (i in 1:length(private$.id)) {
          opts <- list(
            id = private$.id[[i]]
          )
          private$.session$sendCustomMessage("fireworks-start", opts)
        }
      }
      invisible(self)
    },
    #' @details
    #' Stop the fireworks
    stop = function(){
      if (is.null(private$.id)) {
        private$.session$sendCustomMessage("fireworks-stop", list())
      } else {
        for (i in 1:length(private$.id)) {
          private$.session$sendCustomMessage("fireworks-stop", list(id = private$.id[[i]]))
        }
      }
      invisible(self)
    }
  ),
  private = list(
    .id = NULL,
    .session = NULL
  )
)
