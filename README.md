
This repository contains the code for the analysis of susceptable windows of exposure in the PM2.5--ALS association.The repository is organized into 5 main folders.

1) **data**: 
- Contains a folder with a .R file that has directory paths to the secured drive where the patient and air pollution data is stored. 
- It also contains a parish_ses folder where the parsish SES data is located'
- Here you can also find a data dictionary for the patient data and the level description for the categorical variables


2) **code**: 
Contains all code organized into 4 sub-folders:

2a. *packages*: this folder contains the packages.R file which has all of the packages needed for the analysis. Each .rmd calls the packages.R in the first code chunk. 
 
2b. *data prep*: contains the code for the process of merging the patient data with the exposure data and creating the datasets for the 3 different windows of exposures (1-, 5-, and 10-years pre diagnosis) and the lag dataset. Here is also an .rmd for the the process of adding the parish SES variable to each of the datasets. All files within this folder start with a p ('p'reparation) and I recommend going through them in numeric order. That is, stating with p_00, then p_01, and so on. Each Rmd file has a descriptive title referencing its content.
 
2c. *models*: contains the code for all models. All files in this folder start with m ('m'odel) and I recommend you to start with m_00, then m_01, and so on.

    i. functions_yanelli.R  --> has functions that were use in various analyses. This file is load in the first code chunk of each .rmd
    
   ii. m_00_load_datasets.R --> calls for the datasets and is load in the first code chunk of each .rmd 
   
  iii. m_01_pm2.5_fix --> Analysis of association between exposure to PM2.5 and ALS in three different windows of exposure: 1-year, 5-years, and 10-years prior hospitalization. These exposures were calculated by averaging PM2.5 concentrations from 1-year, 5-years, and 10-years prior the day of hospitalization excluding the year of hospitalization. For instance the 1-year averaged exposure refers to the PM2.5 concentration average from the 13-24 months prior hospitalization.
  
   iv. m_02_pm2.5_fix_exposure_nonlinearities --> analysis checking for nonlinearities in the PM2.5--ALS association from iii.
   
   v. m_03_pm2.5_lag_analysis --> contains the distributed lag analysis
   
2d. *model_plots_tbls*: this folder contains the code for the tables and figures included in the manuscript. 
 
 
 
3) **figures** 
Contains the pdf files of figures generated from the code in the model_plots_tbls folder within the code folder. These figures are the ones included in the manuscript. ~In progress


4) **tables**
Contains word files of tables generated from the code in the model_plots_tbls folder within the code folder. These tables are the ones included in the manuscript.


5) **output**
Contains .csv files with the effect estimates generated from the models 


Note: The only code that can be run is the one for the .rmd file *figures*. Everything else deals with confidential data but I have included an .html file for each .rmd so you can review the code outputs and summaries. 
