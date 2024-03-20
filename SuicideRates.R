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