#' fireworks dependencies utils
#'
#' @description This function attaches fireworks dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_fireworks_deps <- function(tag) {
 fireworks_deps <- htmlDependency(
  name = "fireworks",
  version = "0.1.0",
  src = c(file = "fireworks-0.1.0"),
  script = "dist/fireworks.min.js",
  stylesheet = "dist/fireworks.min.css",
  package = "fireworks",
 )
 tagList(tag, fireworks_deps)
}
    
