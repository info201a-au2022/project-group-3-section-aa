#server.R
source("charts_by_age_group.R")
source("by_area_map.R")
source("pollution_factors.R")

server <- function(input, output) {
  output$cases_plot <- renderPlot({
    return(pop_by_age())
  })
  
  output$ratio_plot <- renderPlot({
    return(pop_age_ratio())
  })
  
  output$gender_plot <- renderPlot({
    return(female_male())
  })
  
  output$pie <- renderPlot({
    return(prop_each_sites())
  })
  
  output$sites_plot <- renderPlotly({
    return(mortality_by_sites(input$site))
  })
  
  output$incidence_map <- renderPlot({
    return(map_total_pop("incidence_ratio"))
  })
  
  output$mortality_map <- renderPlot({
    return(map_total_pop("total_mortality"))
  })
  
  output$map <- renderPlotly({
    return(mortality_by_state(input$sites))
  })
  
  output$map_o3 <- renderPlot({return(map_o3())})
  output$map_no2 <- renderPlot({return(map_no2())})
  output$map_so2 <- renderPlot({return(map_so2())})
  output$map_co <- renderPlot({return(map_co())})
  
  output$scatter <- renderPlotly({
    if (input$radio == "NO2") {
      return(no2_scatter())
    } else if (input$radio == "SO2") {
      return(so2_scatter())
    } else if (input$radio == "O3") {
      return(o3_scatter())
    } else {
      return(co_scatter())
    }
  })
}
