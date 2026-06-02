# Leslie Alhakim  
# FINAL -- Part 3: Build a Dashboard

# Load libraries & Prepare dataset
library(readr)
library(stringr)
library(dplyr)
library(ggplot2)
library(paletteer) 
library(shinydashboard)
library(shiny)
library(scales) #helps with formatting; very helpful library

data <- read_csv("CLEAN.csv")

unique(df$rating) #see different ratings

df <- data %>%
  mutate(
    rating = str_trim(as.character(rating)),
    genre  = as.factor(genre),  #make sure these won't give us issues
    decade = paste0(floor(year / 10) * 10, "s"), #create decades
    adult_flag = if_else(rating %in% c("R","X", "NC-17", "TV-MA"), "Adult (R/X/NC-17/TV-MA)", "Non-Adult") 
    #sort rating by adult content v not
  ) %>%
  filter(!is.na(year), !is.na(genre), !is.na(rating))

# Dashboard building 
ui <- dashboardPage(
  skin = "red", #color
  dashboardHeader(title = "How has the Movie Industry Shifted Over the Years?",
                  titleWidth = 500), #more room for title
  dashboardSidebar(width = 300, #inputs going inside sidebar allowing more room for visuals
                   checkboxGroupInput( #check box so you can select different genres
                     inputId = "genre",
                     label = "Movie Genres",
                     choices = sort(unique(df$genre)), #sorted looks nicer
                     selected = sort(unique(df$genre))
                   ),
                   sliderInput(
                     inputId = "year", #slider for years
                     label = "Year range",
                     min = min(df$year, na.rm = TRUE),
                     max = max(df$year, na.rm = TRUE),
                     value = c(min(df$year, na.rm = TRUE), max(df$year, na.rm = TRUE)),
                     step = 1,
                     sep = ""
                   ),
                   selectInput(
                     inputId = "decade", #select decade (for second visual)
                     label = "Decade",
                     choices = sort(unique(df$decade)),
                     selected = sort(unique(df$decade))[1]
                   )
  ),
  dashboardBody(
    fluidRow( #organize by row so use fluid row instead of column
      box(
        width = 12, status = "danger", solidHeader = TRUE, #add solid header & color (danger)
        title = "Adult v Non-Adult Releases From 1980 to 2020", #first plot
        plotOutput("ratings_plot", height = 350)
      )
    ),
    fluidRow(
      box(
        width = 12, status = "danger", solidHeader = TRUE,
        title = "Top 10 Grossing Movies Each Decade", #second plot
        plotOutput("topgross_plot", height = 350)
      )
    )
  )
)

# Build server
server <- function(input, output){
  filtered_data <- reactive({
    req(input$genre, input$year) #two inputs: genre & year
    df %>%
      filter(
        genre %in% input$genre,
        between(year, input$year[1], input$year[2]) #making inputs update our visuals 
      )
  })
  # Build Visuals Two Additional Visuals
  
  # VISUAL 1: Line Plot
  output$ratings_plot <- renderPlot({
    plot_df <- filtered_data() %>% #take updated data based on input
      count(year, adult_flag) %>% #count of adult ratings
      group_by(year) %>% #over the years
      mutate(share = n / sum(n)) %>% #create y variable; how prevalent
      ungroup()
    
    ggplot(plot_df, aes(x = year, y = share, color = adult_flag)) + #color by whether it's adult or not
      geom_line(linewidth = 1) +
      scale_y_continuous(labels = percent_format()) + #make y label look like % for cleaner look
      labs(
        x = "Year",
        y = "Percent of Movies", #so originally, I was going to do individual numbers, but the "shares" looked cleaner
        color = "Rating"
        ) +
      theme_grey() +
      scale_color_paletteer_d("rcartocolor::Prism") #pretty colors
    })
  #VISUAL 2: Bar Chart 
  output$topgross_plot <- renderPlot({
    top10 <- filtered_data() %>% #filter to get top 10 movies
      filter(decade == input$decade, !is.na(gross), gross > 0) %>% #we want decades here
      arrange(desc(gross)) %>% #order these 
      slice_head(n = 10) %>% #top 10
      mutate(name = reorder(name, gross))
    
    ggplot(top10, aes(x = name, y = gross)) +
      geom_col(aes(fill = genre)) +
      coord_flip() + #horizontal plot
      scale_y_continuous(labels = dollar_format(scale = 1e-6, suffix = "M")) + #formatting y label for $$ (again, cleaner look)
      labs(
        x = "Movie",
        y = "Gross",
        title = paste("Top 10 Grossing Movies in", input$decade) #show the decade user selected
        ) +
      theme_grey() +
      scale_fill_paletteer_d("rcartocolor::Prism")
    })
}

# Load Dashboard
shinyApp(ui, server)