# In RStudio, click on 'Run App' on the top right in order to run the app
# in a test version in your own browser. 
library(shiny)
library(ggplot2)
library(bs4Dash)
library(plotly)
library(OpenImageR)
library(shinyalert)

answers <- c("Almost Never", "Sometimes", "Most of the Time", "Not applicable")
source('constants.R') 


labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <- ".mandatory_star { color: red;)"

fluidPage(
  theme = "style.css",
  useShinyalert(),
  # tags$link(rel ='stylesheet', type='text/css', href='bootstrap.css'),
  bs4DashPage(
    title = 'Survey Visualization Tool',
    sidebar_collapsed = FALSE,
    
    # Navbar on top
    navbar = bs4DashNavbar(status = 'primary', skin = 'dark'),
    
    # left sidebar
    sidebar = bs4DashSidebar(
      status = 'primary',
      title = 'ADS Survey Visualization',
      skin='dark',
      
      bs4SidebarMenu(
        bs4SidebarMenu(
          bs4SidebarMenuItem(
            'Home',
            tabName = 'home',
            icon = 'home'
          ),
          bs4SidebarMenuItem(
            'Single Centers',
            tabName = 'single',
            icon = 'wheelchair',
            lapply(1:length(centers), function(i){
              bs4SidebarMenuSubItem(text = centers[i],
                                    tabName = paste0('sub_', gsub(' ', '', centers[i])))
            })
          ),
          bs4SidebarMenuItem(
            'Comparing Centers',
            tabName = 'compare',
            icon = 'sliders'
          ),
          bs4SidebarMenuItem(
            'General Info',
            tabName = 'general',
            icon = 'map-pin'
          ),
          bs4SidebarMenuItem(
            'Survey',
            tabName = 'survey',
            icon = 'id-card'
          )
        )
      )
    ),
    bs4DashBody(
      shinyjs::useShinyjs(),
      shinyWidgets::chooseSliderSkin("HTML5"),
      uiOutput('SingleCenters')
    )
  )
)