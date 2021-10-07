

# list of packages to use
list.of.packages = c('tidyverse', 'haven','ggplot2', 'plotly', 'GGally','caret','readr',
                     'fBasics','raster', 'nortest','MASS','extrafont', 'forestplot',
                     'ggsn','survival','grid','gridExtra', 'cowplot','reshape2',
                     'naniar','rpart','rpart.plot','pROC',
                     'car','olsrr','EnvStats','janitor','tableone', 'reshape', 'xlsx',
                     'sf', 'areal', 'lubridate', 'mgcv', 'itsadug', 'splines', 'pspline', 'dlnm')

# check if list of packages is installed. If not, it will install ones not yet installed
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# load packages
lapply(list.of.packages, require, character.only = TRUE)




