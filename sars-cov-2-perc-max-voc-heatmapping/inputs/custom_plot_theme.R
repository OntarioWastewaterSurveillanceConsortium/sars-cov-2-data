# Custom plot theme;
  custom_plot_theme <- 
    theme_bw() +
    theme(
      plot.title = element_text(family = "Arial", size = 20, face = "bold"),
      panel.background = element_rect(fill = "gray70"),
      panel.border = element_rect(linewidth = 2, fill = NA),
      legend.title = element_text(family = "Arial", size = 16, face = "bold"), 
      legend.text = element_text(family = "Arial", size = 12, face = "bold"),
      
      axis.text.x = element_text(family = "Arial", angle = 0, colour = "black", face = "bold", size = 12),
      axis.ticks.x = element_line(linewidth = 2),
      axis.ticks.length.x = unit(0.15, "cm"),
      axis.ticks.y = element_line(linewidth = 2),
      axis.ticks.length.y = unit(0.1, "cm"),
      
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank()
      )




