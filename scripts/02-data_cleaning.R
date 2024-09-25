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
  select(date, traffctl, visibility, light, rdsfcond, acclass, injury, speeding, ag_driv, alcohol, disability) |>
  tidyr::drop_na()

# Rename multiple columns to understand more easily by the name
cleaned_data <- cleaned_data |>
  rename(
    traffic_control_type = traffctl,
    road_surface_condition = rdsfcond,
    classification_of_accident = acclass,
    aggressive_and_disturbed_driving = ag_driv
  )

# human factors
human_factors_data <-
  cleaned_data |>
  janitor::clean_names() |>
  select(date, speeding, aggressive_and_disturbed_driving, alcohol, disability) |>
  tidyr::drop_na()

# environmental factors
environmental_factors_data <-
  cleaned_data |>
  janitor::clean_names() |>
  select(date, traffic_control_type, visibility, light, road_surface_condition) |>
  tidyr::drop_na()

# result data
result_data <-
  cleaned_data |>
  janitor::clean_names() |>
  select(date, classification_of_accident, injury) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/total_cleaned_data.csv")
write_csv(human_factors_data, "data/analysis_data/human_factors_data.csv")
write_csv(environmental_factors_data, "data/analysis_data/environmental_factors_data.csv")
write_csv(result_data, "data/analysis_data/result_data.csv")

