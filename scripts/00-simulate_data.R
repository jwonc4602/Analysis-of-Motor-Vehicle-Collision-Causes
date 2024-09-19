#### Preamble ####
# Purpose: Simulates the Motor Vehicle Collision Causes data set
# Author: Jiwon Choi
# Date: 19 September 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(tibble)

#### Simulation 1) Human factor vs Environmental factor ####
set.seed(123)  # Setting seed for reproducibility

# Simulate random percentages for human vs environmental factors
simulated_data1 <- tibble(
  "Category" = c("Human", "Environmental"),
  "Percentage" = runif(2, 20, 80)  # Generate random values between 20 and 80
)

# Normalize percentages to sum to 100
simulated_data1 <- simulated_data1 %>%
  mutate(Percentage = round(100 * Percentage / sum(Percentage)))

# Plot: Pie chart to represent human vs environmental factors
plot1 <- ggplot(simulated_data1, aes(x = "", y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Human vs Environmental Factors") +
  theme_void() +
  geom_text(aes(label = paste0(Percentage, "%")), position = position_stack(vjust = 0.5))

# Display the pie chart
print(plot1)

#### Simulation 2) Human factors: AG-DRIV, Alcohol, Speeding ####
set.seed(123)  # Setting seed for reproducibility

# Simulate random data for human factors
human_factors <- tibble(
  "Factor" = c("AG-DRIV", "Alcohol", "Speeding"),
  "Yes" = runif(3, 30, 80),  # Random 'Yes' values between 30 and 80
  "No" = 100 - Yes  # 'No' is complementary to 'Yes' so they sum to 100
)

# Plot: Human factors
human_factors_long <- human_factors %>%
  pivot_longer(cols = c("Yes", "No"), names_to = "Response", values_to = "Count")

plot2 <- ggplot(human_factors_long, aes(x = Factor, y = Count, fill = Response)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Human Factor", y = "Count", fill = "Response", title = "Human Factors (Yes/No)") +
  theme_minimal()

# Display the plot
print(plot2)

#### Simulation 3) Environmental factors: Traffic control, Visibility, Road surface ####
set.seed(123)  # Setting seed for reproducibility

# Simulate random data for traffic control type
traffic_control <- tibble(
  "Control Type" = c("No Control", "Traffic Signal", "Stop Sign", "Pedestrian Crossover"),
  "Count" = runif(4, 20, 60)  # Random counts between 20 and 60
)

# Plot: Traffic control type
plot3 <- ggplot(traffic_control, aes(x = `Control Type`, y = Count)) +
  geom_line(group = 1, color = "blue", size = 1) +
  geom_point(size = 3, color = "blue") +
  labs(x = "Traffic Control Type", y = "Count", title = "Traffic Control Types") +
  theme_minimal()

# Display traffic control plot
print(plot3)

# Simulate random data for visibility conditions
visibility <- tibble(
  "Condition" = c("Clear", "Snow", "Rain"),
  "Count" = runif(3, 30, 80)  # Random counts between 30 and 80
)

# Plot: Visibility conditions
plot4 <- ggplot(visibility, aes(x = Condition, y = Count)) +
  geom_line(group = 1, color = "yellow", size = 1) +
  geom_point(size = 3, color = "yellow") +
  labs(x = "Visibility Condition", y = "Count", title = "Visibility Conditions") +
  theme_minimal()

# Display visibility plot
print(plot4)

# Simulate random data for road surface conditions
road_surface <- tibble(
  "Condition" = c("Dry", "Ice", "Wet"),
  "Count" = runif(3, 30, 80)  # Random counts between 30 and 80
)

# Plot: Road surface conditions
plot5 <- ggplot(road_surface, aes(x = Condition, y = Count)) +
  geom_line(group = 1, color = "darkblue", size = 1) +
  geom_point(size = 3, color = "darkblue") +
  labs(x = "Road Surface Condition", y = "Count", title = "Road Surface Conditions") +
  theme_minimal()

# Display road surface condition plot
print(plot5)

#### Simulation 4) Injury Results ####
set.seed(123)  # Setting seed for reproducibility

# Simulate random injury results
injury_results <- tibble(
  "Injury Type" = c("Fatal", "Major", "Minimal", "Minor", "None"),
  "Count" = runif(5, 500, 9000)  # Random counts between 500 and 9000
)

# Plot: Injury results
plot6 <- ggplot(injury_results, aes(x = `Injury Type`, y = Count, fill = `Injury Type`)) +
  geom_bar(stat = "identity") +
  labs(x = "Injury Type", y = "Count", title = "Injury Results") +
  theme_minimal() +
  geom_text(aes(label = round(Count)), vjust = -0.5)

# Display injury results plot
print(plot6)

