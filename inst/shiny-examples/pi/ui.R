library(shiny)

shinyUI(fluidPage(

    titlePanel("Pi Estimation"),

    sidebarLayout(

        sidebarPanel(



            numericInput("seed", label = "Choose a value for seed", value = 10),

            sliderInput("B", label = "Choose a number below", min = 1, max = 1000000, value = 5000)

        ),

        mainPanel( fluidRow( align = "center",

            plotOutput("plot")),

            verbatimTextOutput("pi"),

            verbatimTextOutput("time")
        )
    )
))
