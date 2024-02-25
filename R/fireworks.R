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
