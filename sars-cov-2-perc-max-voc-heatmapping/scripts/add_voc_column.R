# Add a VOC column to the dataframe based on the sampleDate column;
add_voc_column <- function(df, date_var, start_date, end_date) {
  df <- df %>%
    mutate(
      VOC = as.factor(ifelse(!!sym(date_var) >= start_date &
                   !!sym(date_var) < waves["Alpha"],
                   "Ancestral",
                   
              ifelse(!!sym(date_var) >= waves["Alpha"] & 
                     !!sym(date_var) < waves["Delta"], 
                     "Alpha",
                     
                ifelse(!!sym(date_var) >= waves["Delta"] & 
                       !!sym(date_var) < waves["Omicron BA.1"], 
                       "Delta",
                       
                  ifelse(!!sym(date_var) >= waves["Omicron BA.1"] &
                         !!sym(date_var) < waves["Omicron BA.2"], 
                         "Omicron BA.1",
                         
                    ifelse(!!sym(date_var) >= waves["Omicron BA.2"] & 
                           !!sym(date_var) < waves["Omicron BA.4/BA.5"], 
                           "Omicron BA.2",
                           
                      ifelse(!!sym(date_var) >= waves["Omicron BA.4/BA.5"] & 
                             !!sym(date_var) < waves["Omicron BQ/XBB-like"], 
                             "Omicron BA.4/BA.5",
                             
                        ifelse(!!sym(date_var) >= waves["Omicron BQ/XBB-like"], 
                               "Omicron BQ/XBB-like", NA))))))))
      )

  return(df)
}