library(shiny)
library(ptds2019hw4g06)
library(tidyverse)
library(lubridate)

shinyServer(function(input, output) {

    simulate <- reactive({
        # simulate pi and measure the time here
        ptds2019hw4g06::estimate_pi(input$B, input$seed)

        system.time(ptds2019hw4g06::estimate_pi(input$B, input$seed))

    })

    output$plot <- renderPlot({
        # plot pi
        ptds2019hw4g06:::plot.pi(estimate_pi(input$B, input$seed))
    })

    output$time <- renderText({
        # extract the time of the execution
        print(system.time(ptds2019hw4g06::estimate_pi(input$B, input$seed)))
    })

    output$pi <- renderText({
        # extract the estimated value
        pi <- estimate_pi()
        pi <- pi[["estimated_pi"]]
    })

})
