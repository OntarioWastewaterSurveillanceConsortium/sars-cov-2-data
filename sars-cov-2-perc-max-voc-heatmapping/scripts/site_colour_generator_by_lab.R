#====================================================================================================#
# The 'site_colour_generator_by_lab' function takes the working_data and creates a dataframe 
# containing the specific colours for sampling locations. Colours can be based on either testing 
# institution (lab) or the associated Public Health Region of Ontario (PHR) depending on the supplied
# 'colour_var'
#====================================================================================================#
site_colour_generator_by_lab <- function(df, colour_var) {
  colour_pal <- df %>%
    group_by(siteDesc) %>%
    summarize(
      lab = last(lab),
      # ypos = ypos,
      color = ifelse(colour_var == "lab",
                     lab_colors[match(last(lab), names(lab_colors))],
                ifelse(colour_var == "PHR",
                       phr_colours[match(last(PHR), names(phr_colours))],
                       phu_colours[match(last(PHU), names(phr_colours))]))) %>%
    select(lab, siteDesc, color) %>%
    mutate(lab = factor(lab, levels = c(
      "HSNRI",
      "Carleton University",
      "Queens University",
      "Trent University",
      "University of Ottawa",
      "OntarioTech University",
      "Ryerson University",
      "University of Toronto",
      "University of Waterloo",
      "University of Guelph",
      "McMaster University",
      "Western University",
      "University of Windsor",      
      "NML"
      )))


  colour_pal <- colour_pal %>%
  group_by(siteDesc) %>%
  slice(n())

  return(colour_pal)
}
