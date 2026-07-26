# ==========================================================
# RETAIL PROFITABILITY & GROWTH STRATEGY
# Python Data Analysis - Phase 7
# ==========================================================

import pandas as pd

# ==========================================================
# LOAD DATASET
# ==========================================================

df = pd.read_excel(
    "Data/Raw Dataset/Sample-Superstore-Cleaning.xlsx",
    sheet_name="Orders"
)

print("=" * 60)
print("RETAIL PROFITABILITY & GROWTH STRATEGY")
print("=" * 60)

# ==========================================================
# DATASET OVERVIEW
# ==========================================================

print("\nDATASET OVERVIEW")
print("-" * 60)

print(f"Rows    : {len(df)}")
print(f"Columns : {len(df.columns)}")

print("\nMissing Values")
print(df.isnull().sum())

# ==========================================================
# BUSINESS QUESTION 1
# Which Category generates the highest Sales?
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 1")
print("Which Category generates the highest Sales?")
print("=" * 60)

category_sales = (
    df.groupby("Category")["Sales"]
      .sum()
      .sort_values(ascending=False)
)

print(category_sales.round(2))

# ==========================================================
# BUSINESS QUESTION 2
# Which Region generates the highest Sales?
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 2")
print("Which Region generates the highest Sales?")
print("=" * 60)

region_sales = (
    df.groupby("Region")["Sales"]
      .sum()
      .sort_values(ascending=False)
)

print(region_sales.round(2))

# ==========================================================
# BUSINESS QUESTION 3
# Which Category generates the highest Profit?
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 3")
print("Which Category generates the highest Profit?")
print("=" * 60)

category_profit = (
    df.groupby("Category")["Profit"]
      .sum()
      .sort_values(ascending=False)
)

print(category_profit.round(2))

# ==========================================================
# BUSINESS QUESTION 4
# Which Region generates the highest Profit?
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 4")
print("Which Region generates the highest Profit?")
print("=" * 60)

region_profit = (
    df.groupby("Region")["Profit"]
      .sum()
      .sort_values(ascending=False)
)

print(region_profit.round(2))
# ==========================================================
# BUSINESS QUESTION 5
# Top 10 Products by Sales
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 5")
print("Top 10 Products by Sales")
print("=" * 60)

top_products = (
    df.groupby("Product Name", as_index=False)["Sales"]
      .sum()
      .sort_values(by="Sales", ascending=False)
      .head(10)
      .reset_index(drop=True)
)

print(top_products.round(2))

# ==========================================================
# BUSINESS QUESTION 6
# Bottom 10 Products by Profit
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 6")
print("Bottom 10 Products by Profit")
print("=" * 60)

bottom_products = (
    df.groupby("Product Name", as_index=False)["Profit"]
      .sum()
      .sort_values(by="Profit", ascending=True)
      .head(10)
      .reset_index(drop=True)
)

print(bottom_products.round(2))

# ==========================================================
# BUSINESS QUESTION 7
# Top 10 Customers by Sales
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 7")
print("Top 10 Customers by Sales")
print("=" * 60)

top_customers = (
    df.groupby("Customer Name", as_index=False)["Sales"]
      .sum()
      .sort_values(by="Sales", ascending=False)
      .head(10)
      .reset_index(drop=True)
)

print(top_customers.round(2))

# ==========================================================
# BUSINESS QUESTION 8
# Top 10 States by Profit
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 8")
print("Top 10 States by Profit")
print("=" * 60)

top_states = (
    df.groupby("State", as_index=False)["Profit"]
      .sum()
      .sort_values(by="Profit", ascending=False)
      .head(10)
      .reset_index(drop=True)
)

print(top_states.round(2))

# ==========================================================
# BUSINESS QUESTION 9
# Monthly Sales Trend
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 9")
print("Monthly Sales Trend")
print("=" * 60)

df["Month"] = df["Order Date"].dt.to_period("M")

monthly_sales = (
    df.groupby("Month", as_index=False)["Sales"]
      .sum()
)

print(monthly_sales.round(2))

# ==========================================================
# BUSINESS QUESTION 10
# Discount vs Profit Analysis
# ==========================================================

print("\n" + "=" * 60)
print("BUSINESS QUESTION 10")
print("Average Profit by Discount")
print("=" * 60)

discount_profit = (
    df.groupby("Discount", as_index=False)["Profit"]
      .mean()
      .sort_values(by="Discount")
)

print(discount_profit.round(2))