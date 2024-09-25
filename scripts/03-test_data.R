#### Preamble ####
# Purpose: Tests the cleaned dataset for traffic accident analysis
# Author: Jiwon Choi
# Date: 19 September 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download.R, 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)

# Read the finalized data
finalized_accident_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Data Cleaning ####
# Remove leading/trailing spaces in relevant columns
finalized_accident_data <- finalized_accident_data %>%
  mutate(across(everything(), trimws))  # Remove spaces in all columns

#### Initialize test results ####
test_results <- list()

#### Test unique values for categorical columns ####

# Test 1: 'traffic_control_type' categories
expected_traffic_control_types <- c("No Control", "None", "Pedestrian Crossover", "Police Control",
                                    "School Guard", "Stop Sign", "Streetcar (Stop for)", "Traffic Controller", 
                                    "Traffic Gate", "Traffic Signal", "Yield Sign")
test_results$test_1 <- all(unique(finalized_accident_data$traffic_control_type) %in% expected_traffic_control_types)

# Test 2: 'visibility' categories
expected_visibility <- c("Clear", "Drifting Snow", "Fog, Mist, Smoke, Dust", "Freezing Rain", 
                         "None", "Other", "Rain", "Snow", "Strong wind")
test_results$test_2 <- all(unique(finalized_accident_data$visibility) %in% expected_visibility)

# Test 3: 'light' categories
expected_light <- c("Dark", "Dark, artificial", "Dawn", "Dawn, artificial", "Daylight", 
                    "Daylight, artificial", "Dusk", "Dusk, artificial", "None", "Other")
test_results$test_3 <- all(unique(finalized_accident_data$light) %in% expected_light)

# Test 4: 'road_surface_condition' categories
expected_road_surface_conditions <- c("Dry", "Ice", "Loose Sand or Gravel", "Loose Snow", "None", "Other", 
                                      "Packed Snow", "Slush", "Spilled liquid", "Wet")
test_results$test_4 <- all(unique(finalized_accident_data$road_surface_condition) %in% expected_road_surface_conditions)

# Test 5: 'classification_of_accident' categories
expected_classifications <- c("Fatal", "Non-Fatal Injury", "None", "Property Damage O")
test_results$test_5 <- all(unique(finalized_accident_data$classification_of_accident) %in% expected_classifications)

# Test 6: 'injury' categories
expected_injury <- c("Fatal", "Major", "Minimal", "Minor", "None")
test_results$test_6 <- all(unique(finalized_accident_data$injury) %in% expected_injury)

# Test 7: 'speeding' categories
expected_speeding <- c("None", "Yes")
test_results$test_7 <- all(unique(finalized_accident_data$speeding) %in% expected_speeding)

# Test 8: 'aggressive_and_disturbed_driving' categories
expected_aggressive_driving <- c("None", "Yes")
test_results$test_8 <- all(unique(finalized_accident_data$aggressive_and_disturbed_driving) %in% expected_aggressive_driving)

# Test 9: 'alcohol' categories
expected_alcohol <- c("None", "Yes")
test_results$test_9 <- all(unique(finalized_accident_data$alcohol) %in% expected_alcohol)

# Test 10: 'disability' categories
expected_disability <- c("None", "Yes")
test_results$test_10 <- all(unique(finalized_accident_data$disability) %in% expected_disability)

# Test 11: 'date' format
# Check if the 'date' column is in the correct format 'YYYY-MM-DD'
is_valid_date <- function(date_column) {
  all(!is.na(as.Date(date_column, format = "%Y-%m-%d")))
}

test_results$test_11 <- is_valid_date(finalized_accident_data$date)

print(test_results)
