library(shiny)
library(ptds2019hw4g06) # REPLACE N BY YOUR GROUP NUMBER AND DELETE THIS COMMENT

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
