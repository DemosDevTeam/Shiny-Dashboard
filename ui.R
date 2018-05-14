#library(shiny)
library(shinydashboard)

shinyUI(fluidPage(
    dashboardPage(skin = "blue",
                  dashboardHeader(title = "Demos Dashboard"),
                  dashboardSidebar(
                      sidebarMenu(id = "tabs",
                                  #menuItem("About", tabName = "aboutTab", icon = icon("book")),
                                  menuItem("Gender", tabName = "genderTab", id = "gender",icon = icon("transgender-alt"),
                                           radioButtons(inputId = "genderInput",
                                                        label = "Select a Gender",
                                                        c("All", "Female", "Male", "Non-binary", "Other", "Prefer not to respond"))),
                                  menuItem("Race", tabName = "raceTab", icon = icon("users"),
                                           radioButtons(inputId = "raceInput",
                                                        label = "Select a Race",
                                                        c("All", "Black / African American", "Caucasian", "Asian / Pacific Islander", "Hispanic / Latinx", "Prefer not to respond"))),
                                  menuItem("Income", tabName = "incomeTab", icon = icon("credit-card"),
                                           radioButtons(inputId = "incomeInput",
                                                        label = "Select an Income Range",
                                                        c("All", "0-20,000", "20,000-40,000", "40,000-60,000", "60,000-80,000", "80,000-100,000", "100,000+"))),
                                  menuItem("Age", tabName = "ageTab", icon = icon("cog"),
                                           radioButtons(inputId = "ageInput",
                                                        label = "Select Age Range",
                                                        c("All","0-18", "18-21", "21-25", "25-30", "30-40", "40+"))),
                                  menuItem("Occupation", tabName = "occupationTab", icon = icon("truck"),
                                           radioButtons(inputId = "occupationInput",
                                                        label = "Select Employment Area",
                                                        c("All", "Unemployed", "Employed, part-time", "Employed, full-time", "Employed, with multiple jobs"))),
                                  menuItem("Education", tabName = "educationTab", icon = icon("pencil"),
                                           radioButtons(inputId = "educationInput",
                                                        label = "Select Education Level",
                                                        c("All", "No degree", "High school diploma", "Associate's degree", "Bachelor's degree", "Master's degree", "PhD"))),
                                  menuItem("Children", tabName = "childrenTab", icon = icon("child"),
                                           radioButtons(inputId = "childrenInput",
                                                        label = "Select a Number of Children",
                                                        c("All", "None", "1-2", "3-5", "6+"))),
                                  menuItem("Marital", tabName = "maritalTab", icon = icon("heart"),
                                           radioButtons(inputId = "maritalInput",
                                                        label = "Select Marital Status",
                                                        c("All", "Single, never married", "Single, divorced", "In a relationship", "Married", "Widowed")))
                      )
                  ),
                  dashboardBody(
                      fluidRow(box(plotOutput("plot1", height = 300, width = 500))
                               #, box(plotOutput("plot2", height = 300, width = 500))
                      ),
                      
                      title = "Demos"
                  ))
))