process_wsi_data <- function(data_path, start_date, end_date) {
# Read in the raw Ontario Aggregated WSI data.
  df <- read_excel(file.path(
    data_path, "ontario___extended_aggregated_wsi_dataset.xlsm"),
    sheet = "ext_aggr_wsi_feature_0", 
    skip = 0)

# Data Processing -----------------------------------------------
df <- df %>%
#Select only relevant sites;
  filter(sampleDate >= start_date &
         sampleDate <= end_date) %>%
    
# Rename and clean data;
  mutate(lab = dataSource,
         mBiomarker = mBiomarker*1000,
         sampleDate = as.Date(sampleDate),
         plant_labels = as.character(plant_labels[match(siteDesc, names(plant_labels))])) %>%
    
    group_by(plant_labels) %>%
    mutate(# cpl = mN1N2 * 1000,
      cpl = ifelse(is.na(mN1N2), mN1 * 1000, mN1N2 * 1000),
      cpcp = ifelse(is.infinite(cpl/mBiomarker), NA, cpl/mBiomarker)) %>%

  group_by(siteDesc) %>%
  mutate(cpl = ifelse(is.na(mN1N2), mN1 * 1000, mN1N2 * 1000),
         cpcp = ifelse(is.infinite(cpl/mBiomarker), NA, cpl/mBiomarker)) %>%
    
# Select important columns;
  select(sampleDate,
         siteDesc,
         plant_labels,
         sewershedType,
         cpl,
         cpcp,
         hosp = moh_covidHospitalization,
         moh_cbed,
         lab,
         PHR = publicHealthRegion,
         PHU = publicHealthUnit,
         lat = geoLat, 
         long = geoLong,
         municipalityUpper,
         municipalityLower,
         pop = sewershedPop2020

  )

# Add VOC column;
  df <- add_voc_column(df, "sampleDate", start_date, end_date)
  
  return(df)
}