# R file for preparing .Rmd

# Load required libraries
library(tidyverse)

# Read the dataset
suicide_data <- read_csv("C:/Users/gavin/Downloads/SuicideRates/age_std_suicide_rates_1990-2022.csv")

# Display the structure of the dataset
str(suicide_data)