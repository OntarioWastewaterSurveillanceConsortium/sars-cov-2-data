# Lists containing the unique plants in the siteDesc column:
  plant_names <- c(
    "Amherstburg WWTP",
    "Chatham WPCP",
    "Adelaide WWTP",
    "Greenway WWTP",
    "Denis St Pierre WWTP",
    
    "Leamington PCP",
    "Little River PCP",
    "Lou Romano WRP",
    "Sault Ste Marie E WWTP",
    "Atlantic Ave WPCP",
    
    "Oxford PCP",
    "Pottersburg WWTP",
    "North Bay WWTP",
    "Vauxhaul PCP",
    "Sarnia WPCC",
    
    "Woodstock WWTP",
    "Caledonia WWTP",
    "Hagersville WWTP",
    "Simcoe WPCP",
    "Belleville WPCP",
    
    "Millbrook WWTP",
    "Peterborough WWTP",
    "Lakefield WWTP",
    "Havelock WWTP",
    "Norwood WWTP",
    
    "Ashbridges Bay WPCP",
    "Highland Creek WPCP",
    "North Toronto WWTP",
    "Mid-Halton WWTP",
    "Oakville SW WWTP",
    
    "Hamilton-Woodward Ave WWTP",
    "Acton WWTP",
    "Georgetown WWTP",
    "Oakville SE WWTP",
    "Robert Pickard WPCP",
    
    "Kenora City STP",
    "Haileybury WWTF",
    "Kirkland Lake WWTP",
    "Baker Road WWTP",
    "Dryden WWTP",
    
    "Brantford WPCP",
    "Stamford WWTP",
    "Anger Ave STP",
    "Crystal Beach WWTP",
    "Orangeville WWTP",
    
    "Port Weller STP",
    "Queenston WWTP",
    "Welland WWTP",
    "St Thomas WPCP",
    "Guelph WWTP",
    
    "Kapuskasing WWTP",
    "Greater Sudbury WWTP",
    "Mattagami River WWTP",
    "Moosonee WWTP",
    "Kemptville WPCP",
    
    "Brockville WWTP",
    "Pembroke PCC",
    "Petawawa WWTF",
    "Smiths Falls WWTP",
    "Goderich WPCP",
    
    "Craigleith WPCP",
    "Stratford WPCP",
    "Owen Sound WWTP",
    "Lindsay WWTP",
    "Minden WWTF",
    
    "Cobourg WWTP", # --> No data
    "Barrie WWTP",
    "Corbett Creek WPCP",
    "Collingwood WWTP",
    "Port Darlington WPCP",
    
    "Courtice WPCP",
    "Harmony Creek WPCP",
    "Midland WWTP",
    "Newcastle WPCP",
    "Durham Bayly PS",
    
    "Orillia WTC",
    "Durham Liverpool PS",
    "Cataraqui Bay WWTP", # --> No data
    "Lagoon Lane WWTP",
    "Phillip H Jones PCP",
    
    "Cornwall WWTP",
    "Ravensview WWTP",
    "Hawkesbury WPCP",
    "Humber WPCP",
    "Wallaceburg WWTP",
    
    "Clarkson WPCP",
    "Galt WWTP",
    "GE Booth WWTP",
    "York Humber AMF PS",
    "Kitchener WWTP",
    
    "York Leslie St PS",
    "Waterloo WWTP",
    "York Warden-407"
    
    # "Ottawa Manhole 1",
    # "Ottawa Manhole 2",
    # "Ottawa Manhole 3",
    # "Toronto 1a",
    # "Toronto 1b",
    # "Toronto 2a",
    # "Toronto 2b",
    # "Toronto 4",
    # "Toronto 5",
    )

# List containing "cleaned" plant names:
  plant_labels <- list(
    "Amherstburg",
    "Chatham",
    "London - Adelaide",
    "London - Greenway",
    "Windsor - Denis St. Pierre",
    
    "Leamington",
    "Windsor - Little River",
    "Windsor - Lou Romano",
    "Sault St. Marie",
    "Thunder Bay - Atlantic Ave.",
    
    "London - Oxford",
    "London - Pottersburg",
    "North Bay",
    "London - Vauxhaul",
    "Sarnia",
    
    "Woodstock",
    "Caledonia",
    "Hagersville",
    "Simcoe",
    "Belleville",
    
    "Millbrook",
    "Peterborough",
    "Lakefield",
    "Havelock",
    "Norwood",
    
    "Ashbridges Bay",
    "Highland Creek",
    "North Toronto",
    "Mid-Halton",
    "Oakville - SW",
    
    "Hamilton - Woodward",
    "Acton",
    "Georgetown",
    "Oakville - SE",
    "Ottawa - ROPEC",
    
    "Kenora",
    "Haileybury",
    "Kirkland Lake",
    "Niagara - Baker Road",
    "Dryden",
    
    "Brantford",
    "Niagara - Stamford",
    "Fort Erie - Anger Ave.",
    "Crystal Beach",
    "Orangeville",
    
    "Port Weller",
    "Queenston",
    "Welland",
    "St. Thomas",
    "Guelph",
    
    "Kapuskasing",
    "Greater Sudbury",
    "Mattagami River",
    "Moosonee",
    "Kemptville",
    
    "Brockville",
    "Pembroke",
    "Petawawa",
    "Smiths Falls",
    "Goderich",
    
    "Craigleith",
    "Stratford",
    "Owen Sound",
    "Lindsay",
    "Minden",
    
    "Cobourg", # --> No data
    "Barrie",
    "Corbett Creek",
    "Collingwood",
    "Port Darlington",
    
    "Courtice",
    "Harmony Creek",
    "Midland",
    "Newcastle",
    "Durham - Ajax/Bayly",
    
    "Orillia",
    "Durham - Liverpool",
    "Cataraqui Bay", # --> No data
    "Bracebridge - Lagoon Ln.",
    "Penetanguishene",
    
    "Cornwall",
    "Ravensview",
    "Hawkesbury",
    "Etobicoke - Humber",
    "Wallaceburg",
    
    "Clarkson",
    "Cambridge - Galt",
    "Mississauga - GE Booth",
    "York - Humber AMF",
    "Kitchener",
    
    "York - Leslie",
    "Waterloo",
    "York - Warden"
    ) %>% setNames(plant_names)