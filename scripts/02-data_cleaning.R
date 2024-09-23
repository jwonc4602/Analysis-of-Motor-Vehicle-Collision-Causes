#### Preamble ####
# Purpose: Cleans and prepares the Motor Vehicle Collisions statistics data for analysis.
#          This script focuses on data downloaded from the OpenDataToronto portal, ensuring 
#          it's in the correct format and ready for further statistical analysis or visualization.
# Author: Jiwon Choi
# Date: 18 September 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(tidyr)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Apply clean_names and select necessary columns
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(date, traffctl, visibility, light, rdsfcond, acclass, injury, drivcond, speeding, ag_driv, alcohol, disability) |>
  tidyr::drop_na()

# Rename multiple columns to understand more easily by the name
cleaned_data <- cleaned_data |>
  rename(
    traffic_control_type = traffctl,
    road_surface_condition = rdsfcond,
    classification_of_accident = acclass,
    driver_condition = drivcond,
    aggressive_and_disturbed_driving = ag_driv
  )

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

