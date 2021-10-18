


# 1 year exposure averages

data_1yr <- read_csv(paste0(yanelli_datasets, "one_yr_avg_data_ses.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst))
summary(data_1yr)

# 5 years exposure averages

data_5yrs <- read_csv(paste0(yanelli_datasets, "five_yr_avg_data_ses.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) 

summary(data_5yrs)

# 10 years exposure averages

data_10yrs <- read_csv(paste0(yanelli_datasets, "ten_yrs_avg_data_ses.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) 
summary(data_10yrs)

# 10 years lag averages 

data_lags <- read_csv(paste0(yanelli_datasets, "lagged_10yrs_parishSES.csv")) %>%
  mutate(family_SES = as.factor(family_SES),
         place_birth = as.factor(place_birth),
         residence = as.factor(residence),
         civst = as.factor(civst)) 


