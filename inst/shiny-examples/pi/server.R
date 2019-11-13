library(shiny)
library(ptds2019hw4g06)
library(tidyverse)
library(lubridate)

shinyServer(function(input, output) {

#rv <- reactiveValues(startTime = Sys.time(), endTime = Sys.time())
        simulate <- reactive({
        # simulate pi and measure the time here

        #req(input$B || input$seed)
        #rv$startTime <- Sys.time()
        #pi <- estimate_pi(B = input$B, seed = input$seed)
        #rv$endTime <- Sys.time()

    ptds2019hw4g06::estimate_pi(input$B, input$seed)

    system.time(ptds2019hw4g06::estimate_pi(input$B, input$seed))

    })

    output$plot <- renderPlot({
        # plot pi

# plot.pi(estimate_pi(input$B, input$seed))

    ptds2019hw4g06:::plot.pi(estimate_pi(input$B, input$seed))
    },width = 400, height = 400)

    output$time <- renderText({
        # extract the time of the execution
    #paste("Elapsed time: ",rv$endTime - rv$startTime)
        paste("Elapsed time: ", system.time(ptds2019hw4g06::estimate_pi(input$B, input$seed))["elapsed"])
    })
    output$pi <- renderText({
        # extract the estimated value

        pi <- estimate_pi(B = input$B,seed = input$seed )
        paste("Value of Estimated Pi :",
              pi[["estimated_pi"]])
    })




})
