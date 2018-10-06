#install_all - function for installing all packages in a list that aren't available
#  inspired by https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
#  ex: install_all(c('readr', 'dplyr'))
install_all <- function(list.of.packages) {
  need_install <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(need_install)) install.packages(new.packages)
}

# package_apply_all - function for calling install_all on list of packages, then applying a function to them
#  inspired by https://stackoverflow.com/questions/8175912/load-multiple-packages-at-once
#  ex: package_apply_all(c('readr', 'dplyr'), require)
package_apply_all <- function(list.of.packages, func) {
  install_all(list.of.packages)
  lapply(list.of.packages, func, character.only = TRUE)
}

# get_telco_data - function for retrieving data from Telco churn data csv file, and changing types appropriately
get_telco_data <- function() {
  package_apply_all(c('readr','dplyr'), require)

  # inspired by https://stackoverflow.com/questions/27668266/dplyr-change-many-data-types
  cols.factor.type <- c('gender', 'SeniorCitizen', 'Partner', 'Dependents', 'PhoneService', 'MultipleLines',
                        'InternetService', 'OnlineSecurity', 'OnlineBackup', 'DeviceProtection', 'TechSupport',
                        'StreamingTV','StreamingMovies','Contract','PaperlessBilling','PaymentMethod','Churn')
 
   read_csv('WA_Fn-UseC_-Telco-Customer-Churn.csv') %>%
    mutate_each_(funs(factor), cols.factor.type)
}