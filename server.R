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

server <- function(input, output){n
    output$scatterPlot <- renderPlot({
    xydata <- makeCoordinates(300,
                              input$rotationFraction)
    ggplot(xydata, aes(x = xpos, y = ypos, color=isPrime)) +
        geom_point() +
        scale_color_manual(values=c("azure3","blue")) +
        coord_fixed() +
        theme_void() +
        theme(legend.position="none")
})}
