## server.R

ui <- fluidPage(
    titlePanel("Visualizing primes in a spiral"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Hit the play button to get the idea. Then try entering rotation amounts in rational numbers (e.g. 0.4), versus approximations of irrational numbers (e.g. 0.6180 aka the most irrational number). The first dot is drawn at the origin, and each subsequent dot is drawn at an angle you specify and offset one additional unit from the origin. Prime iterations are colored blue."),
           
            sliderInput("rotationFraction", "Fraction of rotation",
                        min = 0, max = 1, value = 0.4300, step=0.0001,
                        animate=TRUE)
            
               ),

    mainPanel(
        plotOutput("scatterPlot")

   )
))
