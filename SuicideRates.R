# R file for preparing .Rmd

# Load required libraries
library(tidyverse)

# Read the dataset
suicide_data <- read_csv("C:/Users/gavin/Downloads/SuicideRates/age_std_suicide_rates_1990-2022.csv")

# Display the structure of the dataset
str(suicide_data)

# Display the first few rows of the dataset
head(suicide_data)

# Summary statistics
summary(suicide_data)

# Check for missing values
colSums(is.na(suicide_data))

# Unique values in Sex column
unique(suicide_data$Sex)

# Unique values in Year column
unique(suicide_data$Year)



# Filter out rows with missing values in SuicideCount or Population
cleaned_data <- suicide_data %>%
  filter(!is.na(SuicideCount) & !is.na(Population))

# Create a line chart of suicide rates over time
suicide_rates_over_time <- cleaned_data %>%
  group_by(Year) %>%
  summarise(total_suicide_rate = sum(SuicideCount) / sum(Population) * 100000)  # Calculate suicide rate per 100,000 population

# Plot
ggplot(suicide_rates_over_time, aes(x = Year, y = total_suicide_rate)) +
  geom_line(color = "skyblue", size = 1) +
  geom_point(color = "blue", size = 2) +
  labs(title = "Suicide Rates Over Time", x = "Year", y = "Suicide Rate per 100,000 Population") +
  theme_minimal()



# Filter out rows with non-finite values in total_suicide_rate
cleaned_data <- suicide_rates_by_gender %>%
  filter(!is.na(total_suicide_rate) & is.finite(total_suicide_rate))

# Plot
ggplot(cleaned_data, aes(x = Sex, y = total_suicide_rate, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Suicide Rates by Gender", x = "Gender", y = "Suicide Rate per 100,000 Population") +
  theme_minimal()



## Specialized Analysis 1: Analysis of Suicide Rates by Region Over Time

# Filter out rows with missing values in total_suicide_rate
cleaned_data <- suicide_rates_by_region %>%
  filter(!is.na(total_suicide_rate))

# Plot
ggplot(cleaned_data, aes(x = Year, y = total_suicide_rate, color = RegionName)) +
  geom_line() +
  labs(title = "Suicide Rates by Region Over Time",
       x = "Year", y = "Suicide Rate per 100,000 Population",
       color = "Region") +
  theme_minimal()
