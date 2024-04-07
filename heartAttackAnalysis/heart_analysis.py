import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

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

# Correlation between Age and Sex with Heart Attack Risk
# Filter out necessary columns
df_filtered = df[['Age', 'Sex', 'Heart Attack Risk']]

# Convert Sex to numerical values (0 for Female, 1 for Male)
df_filtered.loc[:, 'Sex'] = df_filtered['Sex'].map({'Female': 0, 'Male': 1})

# Group by Age and Sex and calculate the mean Heart Attack Risk
grouped_df = df_filtered.groupby(['Age', 'Sex']).mean().reset_index()

# Plotting line chart
plt.figure(figsize=(10, 6))
sns.lineplot(data=grouped_df, x='Age', y='Heart Attack Risk', hue='Sex', marker='o')
plt.title('Correlation between Age, Sex, and Heart Attack Risk')
plt.xlabel('Age')
plt.ylabel('Heart Attack Risk')
plt.legend(title='Sex', loc='best')
plt.grid(True)
plt.show()