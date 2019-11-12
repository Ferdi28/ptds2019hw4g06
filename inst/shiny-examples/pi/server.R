library(shiny)
library(ptds2019hw4g06)
library(tidyverse)

shinyServer(function(input, output) {

    simulate <- reactive({
        # simulate pi and measure the time here
        start_time <- Sys.time()
        ptds2019hw4g06::estimate_pi(input$B, input$seed)
        end_time <- Sys.time()
    })

    output$plot <- renderPlot({
        # plot pi
        ptds2019hw4g06:::plot.pi()
    })

    output$time <- renderText({
        # extract the time of the execution
        time <- end_time - start_time
        print(time)
    })

    output$pi <- renderText({
        # extract the estimated value
        estimate_pi(B = input$B, seed = input$seed)

    })

})
