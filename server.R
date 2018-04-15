library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    
  })
  
  output$plot1 <- renderPlot({
      print(input$genderInput)
      
      # check if nrow is 0
      if (input$genderInput == "All") {
          barplot(table(df$gender), col = "red")
      } else {
          barplot(table(df %>% filter(gender ==  input$genderInput) %>% select(gender)), col = "red")
      }
    
      #ggplot(df, aes(x = age)) +
          #geom_bar(fill = "blue"
  })
  
})
