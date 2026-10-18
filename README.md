# Customer Marketing & Spending Analytics

## Project Overview

This project analyses customer purchasing behaviour, product-category spending, marketing campaign acceptance, and customer segmentation using a customer marketing dataset containing **2,240 customer records**.

The objective is to transform raw customer data into actionable business insights that can help organisations understand spending patterns, evaluate campaign performance, and identify valuable customer segments.

The project follows an end-to-end analytics workflow using **Python, SQL, Excel, and Power BI**, covering data cleaning, exploratory data analysis, business querying, reporting, and interactive dashboard development.

## Business Objectives

- Analyse spending patterns across six product categories.
- Evaluate customer acceptance across five marketing campaigns.
- Compare purchasing activity across physical stores, web, and catalogue channels.
- Identify differences in spending across education, income, and household segments.
- Examine the relationship between campaign engagement and customer spending.
- Translate analytical findings into practical business recommendations.

## Tools & Technologies

| Tool | Application |
|---|---|
| Python | Data cleaning, preprocessing, feature engineering, and exploratory data analysis |
| Pandas & NumPy | Data manipulation, missing-value analysis, and statistical summaries |
| MySQL | Business queries, aggregations, campaign analysis, and customer segmentation |
| Microsoft Excel | PivotTables, summary tables, and charts |
| Microsoft Power BI | Interactive dashboard development and KPI visualisation |
| Git & GitHub | Version control and project documentation |

## Project Workflow

### 1. Data Cleaning and Preparation — Python

The raw dataset was processed using Pandas and NumPy to prepare it for analysis.

Key activities included:

- Inspecting dataset structure, column names, and data types.
- Identifying missing values and duplicate records.
- Converting customer registration dates into a datetime format.
- Investigating potential income outliers without automatically removing them.
- Flagging unusual birth years and suspicious marital-status categories for review.
- Validating non-negative purchasing measures and binary campaign-response variables.
- Creating a cleaned dataset while preserving the original raw data.

**Output:** A processed customer dataset prepared for downstream analysis.

### 2. SQL Business Analysis — MySQL

SQL queries were developed to answer business questions using aggregations, conditional logic, grouping, and sorting.

Analyses included:

- Total spending by product category.
- Average spending by education and marital status.
- Customer spending segmentation.
- Marketing campaign acceptance counts and rates.
- Purchasing activity across sales channels.
- Website visit frequency compared with web purchases.
- Household composition and average spending.
- Income-based customer segmentation.
- Consolidated customer and spending metrics.

**Output:** A collection of reusable SQL queries for customer and marketing analysis.

### 3. Excel Reporting

Excel was used to summarise results and create business-friendly reports.

The workbook includes analyses covering:

- Product-category spending.
- Spending by education level.
- Campaign acceptance.
- Customer spending segments.

PivotTables, formulas, and charts were used to compare categories and communicate key findings.

### 4. Interactive Dashboard — Power BI

The Power BI component will consolidate the analysis into an interactive dashboard.

Planned dashboard elements include:

- **KPI cards:** Total customers, average customer spending, and customers accepting campaigns.
- **Product analysis:** Spending by product category.
- **Campaign analysis:** Acceptance counts and rates across campaigns.
- **Customer segmentation:** Spending by education, income, and household composition.
- **Channel analysis:** Purchasing activity across physical stores, web, and catalogue.
- **Interactive filters:** Education, marital status, and other relevant customer attributes.

The dashboard will be developed using Power BI Desktop, with visuals and measures designed to support business decision-making.

## Key Findings

### Product-Category Spending

Total recorded spending across the six product categories was **1,356,988**.

| Product Category | Total Spending | Share of Total |
|---|---:|---:|
| Wines | 680,816 | 50.17% |
| Meat Products | 373,968 | 27.56% |
| Gold Products | 98,609 | 7.26% |
| Fish Products | 84,057 | 6.19% |
| Sweet Products | 60,621 | 4.47% |
| Fruit Products | 58,917 | 4.34% |

Wine and meat products together represented approximately **77.73%** of recorded spending across these categories.

**Business implication:** These categories may warrant greater attention in product promotion and inventory planning, while lower-spending categories could be examined for potential growth opportunities.

### Marketing Campaign Performance

| Campaign | Accepted Customers | Acceptance Rate |
|---|---:|---:|
| Campaign 1 | 144 | 6.43% |
| Campaign 2 | 30 | 1.34% |
| Campaign 3 | 163 | 7.28% |
| Campaign 4 | 167 | 7.46% |
| Campaign 5 | 163 | 7.28% |

Campaign 4 recorded the highest acceptance count and rate, while Campaign 2 recorded the lowest.

**Business implication:** Comparing campaign design, targeting, and customer reach could help identify opportunities to improve future marketing performance.

### Campaign Engagement and Spending

| Customer Group | Customers | Average Spending |
|---|---:|---:|
| Accepted at least one campaign | 463 | 1,097.04 |
| Accepted no campaigns | 1,777 | 477.81 |

Customers who accepted at least one campaign had approximately **2.3 times the average recorded spending** of customers who accepted none.

**Business implication:** Campaign engagement may help distinguish customer groups with different spending patterns. However, this association does not establish that campaign participation caused higher spending.

### Purchasing Channel Analysis

| Channel | Total Purchases | Average Purchases per Customer |
|---|---:|---:|
| Physical Store | 12,970 | 5.79 |
| Web | 9,150 | 4.08 |
| Catalogue | 5,963 | 2.66 |

Physical stores recorded the highest purchase count, followed by web and catalogue channels.

**Business implication:** The business could investigate successful in-store purchasing patterns and identify ways to improve online customer conversion.

### Customer Segmentation

The analysis also identified differences in average spending across education, income, marital-status, and household-composition groups.

Customers in the high-income segment recorded substantially higher average spending than those in the middle- and low-income segments. Customers without children or teenagers at home also recorded higher average spending than several household groups.

These findings can inform exploratory segmentation strategies, but should not be interpreted as evidence of causation.

## Project Structure

```text
Customer-Marketing-Spending-Analytics/
├── data/
│   ├── raw/
│   │   ├── marketing_data.csv
│   │   └── marketing_data_dictionary.csv
│   └── processed/
│       └── marketing_data_cleaned.csv
├── notebooks/
│   └── 001_data_cleaning.ipynb
├── sql/
│   └── customer_spending_analysis.sql
├── excel/
│   └── customer_marketing_analysis.xlsx
├── powerbi/
│   └── customer_marketing_dashboard.pbix
├── visuals/
└── README.md
```

*The structure above represents the intended repository layout. Include files and folders as they are finalised.*

## Data Quality & Limitations

- The dataset contains 2,240 customer records and 28 original columns, with additional review flags added during preprocessing.
- Twenty-four income values were missing in the original dataset. During SQL import, these values were represented as zero; this discrepancy requires correction and validation before relying on SQL-based income analysis.
- Potential outliers and unusual categorical values were flagged for investigation rather than automatically removed.
- Spending values represent recorded product-category spending, not profit or verified business revenue.
- Campaign acceptance and spending relationships are descriptive associations and do not establish causality.
- Income bands and spending segments use exploratory thresholds rather than official industry classifications.

## Conclusion

This project demonstrates an end-to-end approach to customer and marketing analytics, combining data preparation, SQL-based business analysis, Excel reporting, and planned Power BI visualisation.

The findings highlight the concentration of spending in wine and meat products, differences in campaign acceptance, variations in customer spending, and the importance of examining purchasing behaviour across customer segments.

The project provides a foundation for developing data-driven recommendations around customer segmentation, marketing effectiveness, and purchasing-channel strategy.

## Skills Demonstrated

`Python` · `Pandas` · `NumPy` · `MySQL` · `SQL` · `Microsoft Excel` · `Power BI` · `Exploratory Data Analysis` · `Data Cleaning` · `Customer Segmentation` · `Marketing Analytics` · `Business Intelligence`

---

**Author:** Arjun Verma

**Project Type:** Customer Analytics | Marketing Analytics | Business Intelligence

