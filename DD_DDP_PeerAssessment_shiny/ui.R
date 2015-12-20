library(shiny)
shinyUI(fluidPage(
  titlePanel("Linear Models Learning Tool"),
  
  fluidRow(
     
    column(12, 
           h3("Application Overview / Documentation"),
           helpText("This application allows a user to enter a set of x, y pairs of numbers",
                    "and to fit a LM to it.  It is meant as a quick learning tool for", 
                    " students new to fitting models to data."),
    
            helpText("First, enter Raw Data Points to the left.  Next, choose Options in the middle.", 
                " The Model Form defines your choice in how y relates to x. ", 
                " The Plot Display defines your choice of whether to display the Raw Data Points or ", 
                " Model Fit or both.", 
                " You can also choose the Chart Title and the x and y Axis Labels. ", 
                " After entering the Raw Data Points to fit, and the Options in the middle, ", 
                " hit the Submit button.", 
                " Lastly, the plot of Raw Data Points and the Model Fit ", 
                " (depending on the Options you choose) appears to the right.")
    )
),

  fluidRow(
    # column headers 
    column(2, 
           h3("Data {x, y}"),
           wellPanel(id = "tPanel",style = "overflow-y:scroll; max-height: 500px",
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x1",
                                           label = "x1", 
                                           value = 1)), 
                       column(6, 
                              numericInput(inputId="y1",
                                          label = "y1", 
                                           value = 2))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x2",
                                           label = "x2", 
                                           value = 2)), 
                       column(6, 
                              numericInput(inputId="y2",
                                           label = "y2", 
                                           value = 4))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x3",
                                           label = "x3", 
                                           value = 3)), 
                       column(6, 
                              numericInput(inputId="y3",
                                           label = "y3", 
                                           value = 6))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x4",
                                           label = "x4", 
                                           value = 4)), 
                       column(6, 
                              numericInput(inputId="y4",
                                           label = "y4", 
                                           value = 8))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x5",
                                           label = "x5", 
                                           value = 5)), 
                       column(6, 
                              numericInput(inputId="y5",
                                           label = "y5", 
                                           value = 10))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x6",
                                           label = "x6", 
                                           value = 6)), 
                       column(6, 
                              numericInput(inputId="y6",
                                           label = "y6", 
                                           value = 12))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x7",
                                           label = "x7", 
                                           value = 7)), 
                       column(6, 
                              numericInput(inputId="y7",
                                           label = "y7", 
                                           value = 14))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x8",
                                           label = "x8", 
                                           value = 8)), 
                       column(6, 
                              numericInput(inputId="y8",
                                           label = "y8", 
                                           value = 16))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x9",
                                           label = "x9", 
                                           value = 9)), 
                       column(6, 
                              numericInput(inputId="y9",
                                           label = "y9", 
                                           value = 18))     
                     ),
                     
                     fluidRow(
                       column(6, 
                              numericInput(inputId="x10",
                                           label = "x10", 
                                           value = 10)), 
                       column(6, 
                              numericInput(inputId="y10",
                                           label = "y10", 
                                           value = 20))     
                     )
                     
           )
    ),
    column(2, 
           h3("Options"), 
           wellPanel(id = "tPanel",style = "overflow-y:scroll; max-height: 450px",
                     fluidRow(
                       column(12, 
            
          selectInput("mySelectInputModelForm", 
                       label = h4("Model Form"), 
                       choices = list("Y = beta0 + beta1 * X" = 1, 
                                      "Y = beta0 + beta1 * log10(X)" = 2, 
                                      "Y = beta0 + beta1 * sqrt(X)" = 3),
                       selected = 1), 
            selectInput("mySelectInputPlotDisplay", 
                   label = h4("Plot Display"), 
                   choices = list("Raw Data" = 1, 
                                  "Model Fit" = 2, 
                                  "Both Raw Data and Model Fit" = 3), 
                   selected = 1),
          
          textInput("myTextInputChartTitle", label = h4("Chart Title"), 
                    value = "Example of Model Fitting"), 
          fluidRow(
            column(6,
                   textInput("myTextInputXAxisLabel", label = h4("X Axis"), 
                             value = "X") 
            ), 
            column(6,
                   textInput("myTextInputYAxisLabel", label = h4("Y Axis"), 
                             value = "Y") 
            )
          )
          )     
                     )),
          submitButton("Submit")
    ),
  
    column(8, 
            h3("Plot"),
           wellPanel(id = "tPanel",style = "overflow-y:scroll; max-height: 500px",
                     fluidRow(
                       column(12, 
            textOutput('textOutputModelParameters'), 
            plotOutput(outputId = "myPlotOutput"),
           plotOutput(outputId = "myPlotOutputModel")
                       )
                     )
              ) 
           
               )
    
  )
  
  
))
