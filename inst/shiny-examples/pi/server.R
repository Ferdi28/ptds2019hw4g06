library(shiny)
library(ptds2019hw4g06)
library(tidyverse)

shinyServer(function(input, output) {

    simulate <- reactive({
        # simulate pi and measure the time here
        start_time <- Sys.time()
        ptds2019hw4g06::estimate_pi(input$B, input$seed)
        end_time <- Sys.time()

        time <- end_time - start_time
    })

    output$plot <- renderPlot({
        # plot pi
        ptds2019hw4g06:::plot.pi(estimate_pi(input$B, input$seed))
    })

    output$time <- renderText({
        # extract the time of the execution
        print(time)
    })

    output$pi <- renderText({
        # extract the estimated value

    })

})
