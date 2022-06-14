###########################
#### rate ratios extract ###
###########################

# Extracting  coefficients from ordinary logistic regression

beta_trans <- function(model, label) {
  beta <- summary(model)$coefficients[2,1]
  beta.se <- summary(model)$coefficients[2,2]
  
  #exponentiate coef and 95% CI
  
  rr <- exp(beta)
  rr.lci <- exp(beta - 1.96 * beta.se)
  rr.uci <- exp(beta + 1.96 * beta.se)
  
  #rate ratio
  
  table <- as_tibble(cbind(beta, beta.se, rr, rr.lci, rr.uci)) %>%
    mutate(model = label) 
  
  table
  
}

# Extracting  coefficients from conditional logistic regression

beta_trans_clog <- function(model, label) {
  beta <- summary(model)$coefficients[1,1]
  beta.se <- summary(model)$coefficients[1,3]
  
  #exponentiate coef and 95% CI
  
  rr <- exp(beta)
  rr.lci <- exp(beta - 1.96 * beta.se)
  rr.uci <- exp(beta + 1.96 * beta.se)
  
  #rate ratio
  
  table <- as_tibble(cbind(beta, beta.se, rr, rr.lci, rr.uci)) %>%
    mutate(model = label) 
  
  table
  
}


# Extracting lag estimates from distributed lag model 

OR_lag <- function(pred_matrix, lag_df) {
  
OR_fit <- as.data.frame(pred_matrix[["matRRfit"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "OR", -PM2.5)

# 95% CI
OR_low <- as.data.frame(pred_matrix[["matRRlow"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "lower_CI", -PM2.5)

OR_upper <- as.data.frame(pred_matrix[["matRRhigh"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "upper_CI", -PM2.5)

# Bind data
OR_4df <- left_join(OR_fit, OR_low, by = c("PM2.5", "lag")) %>%
  left_join(., OR_upper, by = c("PM2.5", "lag")) %>%
  mutate(lag_constr = lag_df) %>%
  dplyr::select(-PM2.5)

}


# Extracting cumulative estimates from distributed lag model 

OR_cumm <- function(pred_matrix, lag_df){
  
# OR  
OR_fit_cumm <- as.data.frame(pred_matrix[["cumRRfit"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "OR_cumm", -PM2.5)

# 95% CI
OR_low_cumm <- as.data.frame(pred_matrix[["cumRRlow"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "lower_CI", -PM2.5)

OR_upper_cumm <- as.data.frame(pred_matrix[["cumRRhigh"]]) %>%
  rownames_to_column(., "PM2.5") %>%
  dplyr::filter(PM2.5 == 1) %>%
  gather(., "lag", "upper_CI", -PM2.5)

# Bind data
df <- left_join(OR_fit_cumm, OR_low_cumm, by = c("PM2.5", "lag")) %>%
  left_join(., OR_upper_cumm, by = c("PM2.5", "lag")) %>%
  mutate(lag_constr = lag_df) %>%
  dplyr::select(-PM2.5)

df

}
