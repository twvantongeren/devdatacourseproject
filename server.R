library(shiny)

shinyServer(function(input, output)
            {

               output$deltaUmText<- renderText({
                  paste("Delta ", input$deltaUm)
               })

               output$locationUmText<- renderText({
                  paste("location", input$locationUm)
               })

               output$residual<- renderText({

                  numberOfBreaks = 50
                  histData <- hist(faithful$eruptions, breaks = numberOfBreaks, plot = FALSE, )
                  xGrid = histData$mids

                  binWidth = (max(faithful$eruptions)-min(faithful$eruptions)) / numberOfBreaks
                  numberOfDatapoints = length(faithful$eruptions)
                  surfaceUnderHistogram = numberOfDatapoints*binWidth

                  theoreticalLeft <- dnorm(xGrid[1:35], mean = input$locationUm - input$deltaUm / 2, sd = input$sdA)*surfaceUnderHistogram/2
                  theoreticalRight <- dnorm(xGrid[36:70], mean = input$locationUm + input$deltaUm / 2, sd = input$sdB)*surfaceUnderHistogram/2

                  sampleLeft = histData$count[1:35]
                  sampleRight = histData$count[36:70]

                  residual <- round(sqrt(sum(theoreticalLeft-sampleLeft)^2 + sum(theoreticalRight-sampleRight)^2),2)

                  paste("residual", residual)

               })


               output$dataPlusOverlay <- renderPlot({

                  numberOfBreaks = 50
                  hist(faithful$eruptions, breaks = numberOfBreaks, xlab = 'Time one eruption takes', main = 'plot of the sample, with the theoretical model as an overlay')
                  
                  binWidth = (max(faithful$eruptions)-min(faithful$eruptions)) / numberOfBreaks
                  numberOfDatapoints = length(faithful$eruptions)
                  surfaceUnderHistogram = numberOfDatapoints*binWidth

                  curve(dnorm(x, mean = input$locationUm + input$deltaUm / 2, sd = input$sdA )*surfaceUnderHistogram/2, add = TRUE, col = 'blue')
                  curve(dnorm(x, mean = input$locationUm - input$deltaUm / 2, sd = input$sdB )*surfaceUnderHistogram/2, add = TRUE, col = 'red')

               })
            }

)

