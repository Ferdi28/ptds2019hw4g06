#' @title Shiny Application of Montecarlo estimation of pi
#' @description Run a shiny app for Montecarlo estimation of pi
#' @import shiny
#' @import ptds2019hw4g06
#' @import tidyverse
#' @import lubridate
#'
#' @export
runDemo <- function() {
  # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT
  appDir <- system.file("shiny-examples", "pi", package = "ptds2019hw4g06")
  if (appDir == "R/RunDemo.R") {
    stop(
      # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT
      "Could not find example directory. Try re-installing ptds2019hw4g06.",
      call. = FALSE
    )
  }

  shiny::runApp(appDir, display.mode = "normal")

}
