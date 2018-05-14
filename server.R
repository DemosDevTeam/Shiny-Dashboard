library(shiny)

# Define server logic required to draw a histogram
# about, gender, race, income, age, occupation, education, children, marital

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
      if (input$tabs == "genderTab") {
          col <- "gender"
      } else if(input$tabs == "raceTab") {
          col <- "race"
      } else if(input$tabs == "incomeTab") {
          col <- "income"
      } else if(input$tabs == "ageTab") {
          col <- "age"
      } else if(input$tabs == "occupationTab") {
          col <- "occupation"
      } else if(input$tabs == "educationTab") {
          col <- "education"
      } else if(input$tabs == "childrenTab") {
          col <- "children"
      } else if(input$tabs == "maritalTab") {
          col <- "marital"
      }
      
      barplot(1)
      #print(input$tabs)
      #sprint(col)
      #print(input[[col]])
      #print(input$tabName)
      
      
      # check if nrow is 0
      #if (input$genderInput == "All") {
      #    barplot(table(df[col]), col = "black")
      #} else {
      #  barplot(table(df %>% filter(gender ==  input$genderInput) %>% select(gender)), col = "black")
      #}
 
  })
  
#  output$plot2 <- renderPlot({
#    
#      # check if nrow is 0
#      if (input$raceInput == "All") {
#          barplot(table(df$race), col = "black")
#      } else {
#          barplot(table(df %>% filter(race ==  input$raceInput) %>% select(race)), col = "black")
#      }
#      
#  })
})
