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

# Count unique values in categorical columns
print("\nCount of unique values in categorical columns:")
categorical_columns = df.select_dtypes(include=['object']).columns
for column in categorical_columns:
    print(f"{column}: {df[column].nunique()} unique values")

# Distribution of target variable (Heart Attack Risk)
print("\nDistribution of Heart Attack Risk:")
print(df['Heart Attack Risk'].value_counts())