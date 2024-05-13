heatmap_generator <- function(df) {
# Heatmap start and end dates;
  start_date <- as.Date("2021-01-01", format = "%Y-%m-%d")
  end_date   <- as.Date("2023-03-31", format = "%Y-%m-%d")

# Set breaks for the heat scale;
  custom_breaks <- seq(0, 100, by = 5)

# Settings got the custom y & x - axis separator lines;
  grid_colour <- "gray20"
  grid_alpha <- 0.50
  grid_type <- "dashed"
  
# Add VOC column based on sampleWeek;
  df <- add_voc_column(df, "sampleWeek", start_date, end_date)
  
# Site and Date Lines ---------------------------
# Create horizontal separation lines between y-axis elements (sites) for readability;
  siteDesc_lines <- data.frame(
    siteDesc = unique(df$siteDesc),
    y = seq_along(unique(df$siteDesc)) - 0.5)

# Create vertical separation lines at the start and end of each month for readability;
  month_boundaries <- data.frame(
    month_start = seq.Date(start_date, end_date, by = "1 month"),
    month_end = seq.Date(start_date, end_date, by = "1 month") %m+% months(1),
    month_center = seq.Date(start_date, end_date, by = "1 month") + days(15))

  
# Grab the plotting data ------------------------  
df <- df[!is.na(df$VOC), ] %>% 
  filter(sampleWeek <= end_date & 
         sampleWeek >= start_date &
         !(siteDesc %in% not_sites))
  
###==========================================================================###
## Graphing Function
###==========================================================================###
# Main Plot and Geoms ---------------------------
heatmap_plot <- 
  ggplot(
    data = df, 
    aes(x = sampleWeek, y = siteDesc)
    ) +
    
  geom_tile(
    aes(fill = per_max_cpcp)
    ) +
    
# Themes and Axis Labels ------------------------
  custom_plot_theme +
  labs(
    title = "", 
    x = "", 
    y = "",
    fill = paste0("% of max. viral signal", "\n", "during period")) +
  
  
# X and Y Scales --------------------------------
  scale_x_date(
    labels = date_format("%b %d\n%Y"),
    breaks = seq.Date(start_date, end_date, "1 months"),
    expand = c(0, 0)
    ) +
  scale_y_discrete(
    limits = rev(site_order$siteDesc),
    expand = c(0, 0)
    ) +
# Legend Items ---------------------------------
  scale_fill_gradientn(
    colors = custom_colors,
    breaks = custom_breaks,
    na.value = NA,
    guide = guide_colorbar(barwidth = 2, barheight = 55)
    ) +
    
# Faceting -------------------------------------
  facet_grid(
    . ~ factor(
      VOC, levels = c('Ancestral', 
                      'Alpha', 
                      'Delta', 
                      'Omicron BA.1', 
                      'Omicron BA.2',
                      'Omicron BA.4/BA.5', 
                      'Omicron BQ/XBB-like')),
    scales = "free_x", 
    space = "free_x"
    ) +
    
# Custom legend for "No data" -----------------

  theme(
    strip.text = element_text(family = "Arial", size = 14, face = "bold"),
    strip.background = element_rect(linewidth = 1.5, colour = "gray20"),
    strip.placement = "outside",
    panel.spacing = unit(-0.0, "lines"),
    axis.text.y = element_text(family = "Arial", 
                               colour = rev(lab_pal$color),
                               face = "bold")
    )

# Horizontal Site Lines ----------------------
  heatmap_plot <- heatmap_plot +
  geom_hline(data = siteDesc_lines, 
             aes(yintercept = y), 
             colour = grid_colour, 
             size = 1, alpha = grid_alpha) 
    
# Monthly Vertical Lines ---------------------  
  # Month start;
  heatmap_plot <- heatmap_plot +
  geom_vline(data = month_boundaries, 
             aes(xintercept = month_start),
             color = grid_colour, 
             linetype = grid_type, 
             size = 0.75, alpha = grid_alpha)
  # Month end;  
  heatmap_plot <- heatmap_plot +  
  geom_vline(data = month_boundaries, 
             aes(xintercept = month_end),
             color = grid_colour, 
             linetype = grid_type, 
             size = 0.75, 
             alpha = grid_alpha)
  
  return(heatmap_plot)
}