voc_heatmaps <- function(df, voc, heat_var, start_date, end_date) {
# Grab the data ---------------------------------
  df <- df[df$VOC == voc & df$peak_var == arrange_var, ] %>%
    mutate(siteDesc = factor(siteDesc,
                             levels = site_order$siteDesc[site_order$VOC == voc & 
                                                          site_order$peak_var == arrange_var]))
# Filter the data;  
  df <- df[!is.na(df$VOC), ] %>%
        filter(sampleDate <= end_date & 
               sampleDate >= start_date)

# Set the breaks for the heat scale -------------
  custom_breaks <- seq(0, 100, by = 10)

# Generate y-axis site colours based on PHR -----
  # phr_pal <- 
  #   site_colour_generator_by_lab(
  #     site_order[site_order$VOC == voc & 
  #               site_order$peak_var == arrange_var, ], 
  #     voc, 
  #     "PHR")
  
  # print(phr_pal)
  
  # phr_pal <- site_order[site_order$VOC == voc & 
  #                       site_order$peak_var == arrange_var, ] %>%
  #   select(VOC, ypos, siteDesc, color) %>%
  #   arrange(desc(ypos))
  # print(phr_pal)

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
  
###==========================================================================###
## Graphing Function
###==========================================================================###
# Main Plot and Geoms ---------------------------
heatmap_plot <- 
  ggplot(data = df,
         aes(x = sampleDate, y = ypos, fill = !!sym(heat_var))
        # y = reorder(siteDesc, as.factor(site_order$siteDesc[site_order$VOC == voc])))
        # y = reorder(siteDesc, lat_long))
  ) +
  
  geom_tile() +
    
# X and Y Scales --------------------------------
  scale_x_date(labels = date_format("%b %d\n%Y"),
               breaks = seq.Date(start_date, end_date, "1 months"),
               # minor_breaks = seq.Date(start_date, end_date, "1 days"),
               # guide = guide_prism_minor(),
               expand = c(0, 0)) +
  
  scale_y_continuous(
    expand = c(0, 0),
    breaks = df$ypos,
    labels = df$siteDesc) + 
    
# Themes and Axis Labels ------------------------
  custom_plot_theme +
  labs(title = paste0(voc, " | ", avg_window, "-day rolling average"),
       x = "", 
       y = "",
       fill = heat_var) +
    
  theme(axis.text.y = element_text(
    face = "bold",
    size = 12,
    colour = df$colour)) +
    
# Legend Items ---------------------------------
  scale_fill_gradientn(
    colors = custom_colors,
    values = rescale(log(custom_breaks)),  # Applying logarithmic scale to breaks
    breaks = custom_breaks,
    # labels = scientific_format(custom_breaks),
    oob = scales::squish,
    # trans = "log",
    na.value = "gray70",
    guide = guide_colorbar(barwidth = 2, barheight = 55)) +
  

##=====================================================================================##
### Graph Add-ons:
##=====================================================================================##
# Horizontal Site Lines ----------------------
heatmap_plot <- heatmap_plot +
  geom_hline(data = siteDesc_lines,
             aes(yintercept = y),
             colour = "gray20",
             size = 1) +

# Monthly Vertical Lines ---------------------
  geom_vline(data = month_boundaries,
             aes(xintercept = month_start),
             color = "gray20",
             linetype = "solid",
             size = 0.75) +

  geom_vline(data = month_boundaries,
             aes(xintercept = month_end),
             color = "gray20",
             linetype = "solid",
             size = 0.75)

  return(heatmap_plot)
}

