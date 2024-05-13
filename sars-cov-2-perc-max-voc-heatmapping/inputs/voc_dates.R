# Approximate VOC start dates;
  waves <- list(
    "Alpha" = as.Date("2021-03-11", format = "%Y-%m-%d"),
    "Delta" = as.Date("2021-07-03", format = "%Y-%m-%d"),
    "Omicron BA.1" = as.Date("2021-11-08", format = "%Y-%m-%d"),
    "Omicron BA.2" = as.Date("2022-02-11", format = "%Y-%m-%d"), 
    "Omicron BA.4/BA.5" = as.Date("2022-06-21", format = "%Y-%m-%d"),
    "Omicron BQ/XBB-like" = as.Date("2022-11-15", format = "%Y-%m-%d")
    )

# List of unique VOCs;
  vocs <- names(waves)