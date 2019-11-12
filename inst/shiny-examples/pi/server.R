library(shiny)
library(ptds2019hw4g06)

shinyServer(function(input, output) {

    simulate <- reactive({
        # simulate pi and measure the time here

    })

    output$plot <- renderPlot({
        # plot pi

    })

    output$time <- renderText({
        # extract the time of the execution

    })

    output$pi <- renderText({

    })

})
