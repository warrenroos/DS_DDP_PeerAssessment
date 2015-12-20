library(shiny)
#x <<- x + 1
#y <<- 0

shinyServer(
  function(input, output) {
    
    x <- 
      reactive({c(input$x1, 
           input$x2, 
           input$x3, 
           input$x4, 
           input$x5, 
           input$x6, 
           input$x7, 
           input$x8, 
           input$x9, 
           input$x10)}) 
    
    y <- 
      reactive({c(input$y1, 
           input$y2, 
           input$y3, 
           input$y4, 
           input$y5, 
           input$y6, 
           input$y7, 
           input$y8, 
           input$y9, 
           input$y10)})
  
    
  
        modelForm = reactive({
      if(input$mySelectInputModelForm == 1) 
      {
        "Y = beta0 + beta1 * X" 
      }
      else if(input$mySelectInputModelForm == 2) 
      {
        "Y = beta0 + beta1 * log10(X)" 
      }
      else 
      {
        "Y = beta0 + beta1 * sqrt(X)" 
      }
    })
    
    plotType = reactive({
      if(input$mySelectInputPlotDisplay == 1) 
      {
        "p" 
      }
      else if(input$mySelectInputPlotDisplay == 2) 
      {
        "l" 
      }
      else 
      {
        "b"
      }
    })

        modelFit <- reactive({
    
        
          if(input$mySelectInputModelForm == 1) 
          {
            # "Y = beta0 + beta1 * X" 
            lm(y() ~ x())
          }
          else if(input$mySelectInputModelForm == 2) 
          {
            # "Y = beta0 + beta1 * log10(X)" 
            lm(y() ~ log10(x()))
          }
          else 
          {
            "Y = beta0 + beta1 * sqrt(X)" 
            lm(y() ~ sqrt(x()))
          }
        })

        y.est <- 
          reactive({
            if(input$mySelectInputModelForm == 1) 
            {
              # "Y = beta0 + beta1 * X"
              beta0() + beta1() * x()
            }
            else if(input$mySelectInputModelForm == 2) 
            {
              # "Y = beta0 + beta1 * log10(X)" 
              beta0() + beta1() * log10(x())
              
            }
            else 
            {
              # "Y = beta0 + beta1 * sqrt(X)" 
              beta0() + beta1() * sqrt(x())
              
            }
            
          })
        
        output$myPlotOutput  <- renderPlot({
          #      output$myPlotOutput  <- reactivePlot({
          #plot(x,y, 
          if(input$mySelectInputPlotDisplay == 1) 
          {
            # data 
            plot(x(),y(), 
               main = input$myTextInputChartTitle, 
               xlab = input$myTextInputXAxisLabel, 
               ylab = input$myTextInputYAxisLabel,
               type = "p"
            )
            }
          else if(input$mySelectInputPlotDisplay == 2) 
          {
            plot(x(),y.est(), 
                 main = input$myTextInputChartTitle, 
                 xlab = input$myTextInputXAxisLabel, 
                 ylab = input$myTextInputYAxisLabel,
                 type = "l"
            )
          }
          else 
          {
            plot(x(),y(), 
                 main = input$myTextInputChartTitle, 
                 xlab = input$myTextInputXAxisLabel, 
                 ylab = input$myTextInputYAxisLabel,
                 type = "p"
            )
            lines(x(),y.est()
            )
          }
  })
        
        output$myPlotOutputModel  <- renderPlot({
          #      output$myPlotOutput  <- reactivePlot({
          #plot(x,y, 
          par(mfrow = c(2,2)); plot(modelFit())
          #lines(modelFit())
          #plot(modelFit()) 
#                main = input$myTextInputChartTitle, 
#                xlab = input$myTextInputXAxisLabel, 
#                ylab = input$myTextInputYAxisLabel,
#                type = plotType()
#           )
        })
        
#         x <- 1:5; modelFit <- lm(c(1:3, 7, 6) ~ x); modelFitCoef <- coef(modelFit)
#         modelFitCoef['(Intercept)']
#         modelFitCoef['x']

        modelFitCoef <- reactive({coef(modelFit())})
        beta0 <- reactive({modelFit()$coefficients['(Intercept)'] })  
        beta1 <- reactive({modelFit()$coefficients[2]})  

        
        output$textOutputModelParameters <- renderText({
          paste0("Plot (beta0 = ", beta0(), ", beta1 = ", beta1(), ") ")
        })
          
  }
)