library(shiny)

shinyUI(fluidPage(

    titlePanel("Pi Estimation"),

    sidebarLayout(

        sidebarPanel(

            selectInput("method", label = "estimate pi", choices = c("estimate_pi()","find_pi") ),

            numericInput("seed", label = "Choose a numerical value", value = 10),

            sliderInput("B", label = "Choose a number between 1 and 1000000", min = 1, max = 1000000, value = 5000)

        ),

        mainPanel(

            plotOutput("plot"),

            textOutput("time"),

            textOutput("pi")
        )
    )
))
