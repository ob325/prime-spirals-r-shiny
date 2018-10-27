ui <- fluidPage(
    titlePanel("Visualizing primes in a spiral"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Try entering rotation amounts in rational numbers (e.g. 0.4), versus approximations of irrational numbers (e.g. 0.6180). The first dot is drawn at the origin, and each subsequent dot is drawn at an angle you specify and offset one additional unit from the origin. Prime iterations are colored blue.

What patterns can you find that are interesting? What are the characteristics of numbers that produce straight 'spokes,' and what does the number of spokes tell you about the denominator of that number's integer fraction representation?

billobrien.wordpress.com"),
           
            sliderInput("rotationFraction", "Fraction of rotation",
                        min = 0, max = 1, value = 0.4327, step=0.0001)
    ),
    mainPanel(
        plotOutput("scatterPlot")

   )
))
