library(shiny)

shinyUI(fluidPage(

    titlePanel("Pi Estimation"),

    sidebarLayout(

        sidebarPanel(

            selectInput("method", ...),

            numericInput("seed", ...),

            sliderInput("B", ...)

        ),

        mainPanel(

            plotOutput("plot"),

            textOutput("time"),

            textOutput("pi")
        )
    )
))
