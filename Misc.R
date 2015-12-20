
library(slidify)
author("DS_DDP_PeerAssessment_slidify")


library(shiny)

),
submitButton("Submit")

# shiny ui examples 
fluidRow(
  
  column(3,
         h3("Buttons"),
         actionButton("action", label = "Action"),
         br(),
         br()
  ),
  
  column(3,
         h3("Single checkbox"),
         checkboxInput("checkbox", label = "Choice A", value = TRUE)),
  
  column(3, 
         checkboxGroupInput("checkGroup", 
                            label = h3("Checkbox group"), 
                            choices = list("Choice 1" = 1, 
                                           "Choice 2" = 2, "Choice 3" = 3),
                            selected = 1)),
  
  column(3, 
         dateInput("date", 
                   label = h3("Date input"), 
                   value = "2014-01-01"))   
),

fluidRow(
  
  column(3,
         dateRangeInput("dates", label = h3("Date range"))),
  
  column(3,
         fileInput("file", label = h3("File input"))),
  
  column(3, 
         h3("Help text"),
         helpText("Note: help text isn't a true widget,", 
                  "but it provides an easy way to add text to",
                  "accompany other widgets.")),
  
  column(3, 
         numericInput("num", 
                      label = h3("Numeric input"), 
                      value = 1))   
),

fluidRow(
  
  column(3,
         radioButtons("radio", label = h3("Radio buttons"),
                      choices = list("Choice 1" = 1, "Choice 2" = 2,
                                     "Choice 3" = 3),selected = 1)),
  
  column(3,
         selectInput("select", label = h3("Select box"), 
                     choices = list("Choice 1" = 1, "Choice 2" = 2,
                                    "Choice 3" = 3), selected = 1)),
  
  column(3, 
         sliderInput("slider1", label = h3("Sliders"),
                     min = 0, max = 100, value = 50),
         sliderInput("slider2", "",
                     min = 0, max = 100, value = c(25, 75))
  ),
  
  column(3, 
         textInput("text", label = h3("Text input"), 
                   value = "Enter text..."))   
)
# shinyUI(pageWithSidebar(
#   headerPanel("Data science FTW!"),
#   sidebarPanel(
#     h3('Sidebar text'),
#     textInput(inputId="text1", label = "Input Text1"),
#     textInput(inputId="text2", label = "Input Text2")
#   ),
#   mainPanel(
#     h3('Main Panel text'),
#     p('Output text1'),
#     textOutput('text1'),
#     p('Output text2'),
#     textOutput('text2'),
#     p('Output text3'),
#     textOutput('text3'),
#     p('Outside text'),
#     textOutput('text4'),
#     p('Inside text, but non-reactive'),
#     textOutput('text5')
#   )
# ))
#,
#textOutput('text2'),
#textOutput('text3'),
#textOutput('textModelFit')

# SHINY SERVER 
#     #y <<- y + 1
#     output$text1 <- renderText({input$text1})
#     output$text2 <- renderText({input$text2})
#     output$text3 <- renderText({as.numeric(input$text1)+1})
#     output$text4 <- renderText(y)
#    output$text5 <- renderText(x)
#     output$myPlotOutput  <- renderPlot({
#             #        hist(rnorm(input$x1))
#     #plot(1,1)
#     plot(input$x1,input$y1)
#     #  hist(rnorm(2,2))
#     })

#modelFitSummaryCoefficients <- reactive({summary(modelFit()$coefficients)})

#output$text2 <- renderText({beta0()})
#output$text3 <- renderText({beta1()})
#output$textModelFit <- renderText({modelFit()$coefficients})

#output$text2 <- renderText(paste0("***", {modelFitCoef()}, "***"))
#        output$text2 <- renderText({beta1()})
#output$text2 <- renderText(paste0("***", {input$mySelectInputModelForm}, "***"))

#    output$text2 <- renderText(paste0("***", {input$myCheckGroupPlotDisplay[1]}, "***"))
#output$text3 <- renderText({modelFitSummaryCoefficients()})

#    output$text3 <- 9renderText({input$myTextInputChartTitle})

