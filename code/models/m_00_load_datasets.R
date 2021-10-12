
# 1 year exposure averages

data_1yr <- read_csv(paste0(yanelli_datasets, "one_yr_avg_data.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) %>% 
  dplyr::filter(residence != "Greenland") %>%
  droplevels() 
summary(data_1yr)

# 5 years exposure averages

data_5yrs <- read_csv(paste0(yanelli_datasets, "five_yr_avg_data.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) %>% 
  dplyr::filter(residence != "Greenland") %>%
  droplevels()

summary(data_5yrs)

# 10 years exposure averages

data_10yrs <- read_csv(paste0(yanelli_datasets, "ten_yrs_avg_data.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) %>% 
  dplyr::filter(residence != "Greenland") %>%
  droplevels()
summary(data_10yrs)

# 10 years lag averages 

data_lags <- read_csv(paste0(yanelli_datasets, "lagged_10yrs_parishSES.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) %>% 
  dplyr::filter(residence != "Greenland") %>% # only has 22 observations which is too little and results in unstable estimates so I removed this category 
  droplevels()