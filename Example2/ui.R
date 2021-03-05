
library(shiny)


shinyUI(fluidPage(
    
    
    titlePanel("Visualization Workshop Example 2"),
    
    
    sidebarLayout(
        sidebarPanel(
            selectInput("x","Select Variable X",
                        choices=c("TOTCHOL"=1,"SYSBP"=2,"DIABP"=3,
                                  "HEARTRTE"=4,"BMI"=5,"GLUCOSE"=6)),
            selectInput("y","Select Variable Y",
                        choices=c("TOTCHOL"=1,"SYSBP"=2,"DIABP"=3,
                                  "HEARTRTE"=4,"BMI"=5,"GLUCOSE"=6)),
            radioButtons("color","Choose color for scatterplot",
                         c("green","red","blue")),
            checkboxInput("line","Do you want to fit regression line",FALSE)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("Dataset",dataTableOutput("mytable")),
                        tabPanel("Plot",plotOutput("myplot")),
                        tabPanel("Summary Statistics",uiOutput("summary")),
                        tabPanel("Regression Result",uiOutput("regression")))
        )
    )
))
