wsi_axis_order <- function(df, arrange_var) {
  site_order <- df %>%
    # group_by(VOC) %>%
    summarize(
      arrange_var = factor(!!sym(arrange_var), levels = c(
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
        )),
      siteDesc = siteDesc
      ) %>%
    
    distinct %>%
    group_by(siteDesc) %>%
    slice(n()) %>%
    arrange(arrange_var) %>%
    ungroup
}