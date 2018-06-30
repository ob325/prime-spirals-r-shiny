# Visualizing primes in a sprial
# Bill O'Brien 2018 | billobrien.wordpress.com


library(dplyr)
library(ggplot2)
library(shiny)
library(primefactr)

makeCoordinates <- function(nIter, rotationFraction){
    primeList <- AllPrimesUpTo(10000)
    df <- data.frame(i = seq(0, nIter-1, 1))
    df <- df %>%
        mutate(angle = rotationFraction * (2*pi) * i,
               xpos = round(i * cos(angle), 0.0001),
               ypos = round(i * sin(angle), 0.0001),
               isPrime = is.element(i, primeList),
               nIterPerRotation = angle %/% (2*pi) ) %>%
        select(i, xpos, ypos, isPrime, nIterPerRotation)
    return(df)
}

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
 
server <- function(input, output){n
    output$scatterPlot <- renderPlot({
    xydata <- makeCoordinates(600,
                              input$rotationFraction)
    ggplot(xydata, aes(x = xpos, y = ypos, color=isPrime)) +
        geom_point() +
        scale_color_manual(values=c("azure3","blue")) +
        coord_fixed() +
        theme_void() +
        theme(legend.position="none")
})}
