rm(list=ls())

# Create Folder Structure
# Air Pollution Exposure and Risk of Amyotrophic Lateral Sclerosis (ALS)
# Robbie M Parks and Arin Balalian

####***********************
#### Table of Contents #### 
####***********************

# D: Description
# 0: Preparation 
# 1: Create Folder Structure

####********************
#### D: Description ####
####********************

# Script to initially set up all the folder structure if not already there

####********************
#### 0: Preparation #### 
####********************

# 0a Load Packages
library(here)

####********************************
#### 1: Create Folder Structure #### 
####********************************

# 1a Declare directories (can add to over time)
project.folder <- paste0(print(here::here()),'/')
 code.folder <- paste0(project.folder, "code/")
    data.prep.code.folder <- paste0(code.folder, "data_prep/")
    packages.folder <- paste0(code.folder, "packages/")
    models.folder <- paste0(code.folder, "models/")
 data.folder <- paste0(project.folder, "data/")
    file.locations.folder <- paste0(data.folder, "file_locations/")
 output.folder <- paste0(project.folder, "output/")
 figures.folder <- paste0(project.folder, "figures/")
 tables.folder <- paste0(project.folder, "tables/")
  
 

# 1b Identify list of folder locations which have just been created above
folders.names <- grep(".folder",names(.GlobalEnv),value=TRUE)

# 1c Create function to create list of folders
# note that the function will not create a folder if it already exists 
create_folders <- function(name){
  ifelse(!dir.exists(get(name)), dir.create(get(name), recursive=TRUE), FALSE)
}

# 1d Create the folders named above
lapply(folders.names, create_folders)
