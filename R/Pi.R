
#' @title Montecarlo estimation of Pi and its own Plot function
#' @description Compute an approximation of Pi by Monte-Carlo integration using
#' uniform sampling and Plot its result
#' @param B A  \code{numeric} (integer) used to denote the number of simulations.
#' @param seed A \code{numeric} (integer) used to control the seed of the random number
#' generator used by this function.
#' @return A  \code{list} containing the following attributes:
#' \describe{
#'      \item{estimated_pi}{Estimated value of Pi}
#'      \item{points}{Data frame with 3 variables used to plot the area of the estimated Pi}
#' }
#' @importFrom stats runif
#' @import tidyverse
#' @import dplyr
#' @import useful
#' @import ggplot2
#' @export
#' @examples
#'estimate_pi()
#'plot(estimate_pi())


#Problem 0: modify find_pi from Homework #3

###Estimate_pi function

  estimate_pi <- function(B = 5000, seed = 10) {

    #Conditions for which the function stops
  if (is.na(B) || is.character(B) || length(B) !=1 || B %% 1 != 0){
  stop("Please insert a positive and integer value for B")
  }
    if (is.na(seed) || is.character(seed) || length(seed) !=1 || seed %% 1 != 0){
   stop("seed needs to be positive and integer")
  }

    # set a seed
      set.seed(seed)

      # simulate B points
      points <- tibble(
          x = runif(n = B, min = -1, max = 1),
          y = runif(n = B, min = -1, max = 1),
          inside = rep(NA, B)
      )

      points <- points %>%
        mutate( inside = ifelse((points[,1])^2 + (points[,2])^2<=1,1,0))

      estimated_pi <-  4*sum(points$inside)/B

      # create a new list
      rval <- list(
          estimated_pi = estimated_pi,
          points = points
      )

      # assign pi class to rval
      class(rval) <- "pi"

      # return rval
      return(rval)

  }

### Plot the result of estimate_pi
  plot.pi <- function(x) {

    #extract the coordinates from the list
    points <- x[["points"]]

    #plot
    points %>%
      ggplot2::ggplot(aes(x = x, y = y, color = ifelse(points$inside == 1,"darkcyan","darkorange3"))) +
      geom_point() +
      annotate("path",
               x=0+1*cos(seq(0,2*pi,length.out=100)),
               y=0+1*sin(seq(0,2*pi,length.out=100))) +
      geom_rect(aes(xmin = -1, xmax = 1, ymin = -1, ymax = 1), color = "black", fill = alpha("grey",0), linetype = 3) +
      labs(title = "Plot of estimated PI Area", x = "x", y = "y", col = "") +
      scale_color_manual(labels = c("Values inside Pi area", "Values outside of Pi area"), values = c("darkcyan", "darkorange3")) +
      theme_bw() +
      theme(legend.position = "bottom")
  }

