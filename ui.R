library(shiny)
shinyUI(fluidPage(
                  titlePanel("Developing data products (Coursera)"),
                  sidebarLayout(
                                sidebarPanel( 
                                             h3("Double normal distribution"),
                                             p("Some distributions are best not described by a mean and standard deviation."),
                                             p("One example a dataset like this is the faithful dataset which is always present in R."),
                                             p("If one would assume this dataset is the sum of two normal distributions one could make."),
                                             p("A distribution which is more relevant to this situation"),
                                             p("The two upper slider move the center (green) of the distribution, and the distance (purple) (between the two normal distributions"),
                                             p("The two sliders on the bottom determine the spread in the spread in the left and right side of the distribution"),
                                             p("The user can see how wel the curve fits by minimizing the residual value on the bottom of the mainpanel"),
                                             sliderInput("deltaUm",label = "distance between means (Delta)", min = 0, max = 5 , value = 2, step = 0.1),
                                             sliderInput("locationUm",label = "center between the means (Location)", min = 0, max = 5, value = 2, step = 0.1),
                                             sliderInput("sdA", label = "Standard deviation Blue", min = 0, max = 2, value = 1, step = 0.01),
                                             sliderInput("sdB", label = "Standard deviation Red", min = 0, max = 2, value = 1, step = 0.01),
                                             img(src="explainApp.png", height = 200, width = 200)
                                             ),

                                mainPanel(
                                          h1("This shows the plot of two normal distributions: "),
                                          plotOutput("dataPlusOverlay"),
                                          textOutput("deltaUmText"),
                                          textOutput("locationUmText"),
                                          textOutput("residual")
                                          )

                                )
                  )
)

