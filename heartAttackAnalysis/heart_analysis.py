import pandas as pd

# Load the dataset
file_path = r'C:\Users\gavin\RProjects\Health-Analysis\heartAttackAnalysis\heart_attack.csv'
df = pd.read_csv(file_path)

# Summary statistics
print("Summary statistics:")
print(df.describe())

# Check for missing values
print("\nMissing values:")
print(df.isnull().sum())
