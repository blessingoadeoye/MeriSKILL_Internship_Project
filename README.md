# MeriSKILL Internship Projects

## Introduction

This repository comprises two data analytics projects completed during my Data/Business Analytics internship with **MeriSKILL**:

1. **Sales Data Analysis** — Exploring sales trends, product performance, revenue, and geographic sales distribution.
2. **HR Attrition Analysis** — Examining employee attrition across demographic, job-related, engagement, and organizational characteristics.

The internship provided an opportunity to apply data analytics skills to practical business questions, using **SQL for data analysis** and **Power BI for data visualization**.

Each project addresses a different business problem and is presented separately below.

The Sales Analysis recorded approximately **$34.48 million in sales revenue for 2019**, with the highest order activity occurring in the final quarter. The HR Attrition Analysis examined **1,470 employees**, including **237 recorded departures**, representing an overall attrition rate of **16.12%**.

## Background

The MeriSKILL Data/Business Analytics internship provided practical experience in examining datasets, identifying business patterns, and presenting analytical findings.

Two datasets were examined during the internship:

- **Sales Dataset:** Sales transactions containing order dates, order identifiers, products, quantities, prices, and geographic information.
- **HR Dataset:** Employee records containing demographic information, job characteristics, attrition status, engagement indicators, and satisfaction ratings.

The projects were analyzed independently, with SQL used to answer the business questions and Power BI used to present the results visually.

## Project Materials and Deliverables

| Project | SQL workflow | Dashboard |
|---|---|---|
| Sales Data Analysis | [Sales SQL analysis](analysis_workflow/Sales%20Analysis.sql) | [Sales dashboard](reports/Sales%20Analysis%20Report.png) |
| HR Attrition Analysis | [HR SQL analysis](analysis_workflow/HR%20Attrition%20Analysis.sql) | [HR dashboard](reports/HR%20Analytics%20Report.1.png) |

**Dataset availability:** The original datasets are not included in the documented repository files, and their download sources have not been verified. The SQL workflows and exported dashboard images preserve the analysis and its visual deliverables. Reproducing the results requires the source datasets and corresponding SQL tables.

## Tools and SQL Techniques

- **SQL:** Data querying, filtering, aggregation, grouping, and conditional categorization.
- **SQL Functions and Techniques:** `COUNT()`, `COUNT(DISTINCT)`, `SUM()`, `GROUP BY`, `ORDER BY`, `WHERE`, and `CASE` expressions.
- **Power BI:** Interactive dashboards and visual reporting.
- **Data Analysis:** Exploring business trends, comparing categories, and interpreting results.
- **Business Reporting:** Communicating analytical findings to support business understanding.

---

# Project One: Sales Data Analysis

## Project Description

This project involved exploring a sales dataset to understand sales performance over time, identify frequently purchased products, examine revenue contributions, and compare sales across cities.

The analysis focused on identifying patterns that could inform business decisions about sales performance and product priorities.

### Business Task

Analyze the sales data to:

- Identify monthly and quarterly sales trends.
- Determine the most frequently ordered products.
- Examine product quantities and revenue contributions.
- Calculate overall sales revenue.
- Compare sales revenue across cities.
- Present the findings through a Power BI dashboard.

### Business Questions and Analytical Reasoning

Beyond calculating totals, I wanted to understand what different sales measures could tell the business:

1. When was order activity strongest, and what might that mean for demand planning?
2. Do the products customers order most frequently also generate the most revenue?
3. How do order frequency, units sold, and revenue change the interpretation of product performance?
4. Which locations contributed most to recorded revenue, and what would be needed to explain the differences?

These questions shaped the analysis. Distinct order counts were used to measure purchasing activity, while quantities and revenue were considered separately to avoid treating different measures as interchangeable.

## SQL Analysis

The SQL analysis examined seven questions covering order trends, product performance, overall revenue, and geographic distribution.

**SQL file:** [Sales Analysis.sql](analysis_workflow/Sales%20Analysis.sql)

### 1. Monthly and Quarterly Order Trends

**Analytical Question:** How did order activity change across the months and quarters of 2019?

The analysis counted distinct orders to examine how sales activity changed throughout the year.

A representative part of the analysis involved grouping orders by month:

```sql
SELECT
    MONTH(order_date) AS sales_month,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);
```

The recorded monthly results showed:

| Period | Recorded Orders |
|---|---:|
| January | 9,262 |
| February | 11,496 |
| March | 14,549 |
| April | 17,528 |
| May | 15,836 |
| June | 12,989 |
| July | 13,761 |
| August | 11,484 |
| September | 11,202 |
| October | 19,436 |
| November | 16,859 |
| December | 24,004 |

December recorded the highest monthly order count at **24,004**, followed by October at **19,436**.

The quarterly analysis also showed stronger order activity toward the end of the year:

| Quarter | Recorded Orders |
|---|---:|
| Q1 | 35,307 |
| Q2 | 46,353 |
| Q3 | 36,447 |
| Q4 | 60,299 |

**Finding:** Q4 recorded the highest order count, indicating that order activity was strongest in the final quarter of the reporting year.

### 2. Product Performance

**Analytical Question:** Which products performed best by order frequency, quantity ordered, and revenue?

Product performance was examined using three different measures:

- **Order frequency:** The number of distinct orders containing each product.
- **Quantity ordered:** The total number of units ordered.
- **Sales revenue:** The revenue generated by each product.

The SQL analysis used distinct order counts, quantity aggregation, and revenue aggregation to compare product performance.

For example, product revenue was examined by aggregating sales values across products:

```sql
SELECT
    Product,
    SUM(sales) AS total_revenue
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY Product
ORDER BY total_revenue DESC;
```

The leading products differed depending on the measure used.

| Performance Measure | Leading Product | Recorded Result |
|---|---|---:|
| Order frequency | USB-C Charging Cable | 21,851 orders |
| Quantity ordered | AAA Batteries (4-pack) | 31,017 units |
| Sales revenue | MacBook Pro Laptop | $8,035,900.00 |

The USB-C Charging Cable appeared in the highest number of distinct orders, while AAA Batteries (4-pack) had the highest recorded quantity ordered.

However, the MacBook Pro Laptop generated the highest product revenue.

**Finding:** Frequently ordered products were not necessarily the largest contributors to revenue. Considering order frequency, quantity, and revenue separately provided a more complete view of sales performance.

### 3. Overall Sales Revenue

**Analytical Question:** How much sales revenue was recorded during 2019?

The SQL analysis used revenue aggregation to calculate the overall sales revenue for the reporting year.

```sql
SELECT
    SUM(sales) AS total_revenue
FROM sales_data
WHERE order_date < '2020-01-01';
```

The SQL analysis recorded approximately **$34.48 million** in total sales revenue for 2019.

| Metric | Recorded Result |
|---|---:|
| Total Sales Revenue | $34,483,365.68 |

This figure represents sales revenue, not business profit.

### 4. Geographic Sales Performance

**Analytical Question:** Which cities generated the highest recorded sales revenue?

The original SQL results also compared sales revenue across cities.

| City | Recorded Revenue |
|---|---:|
| San Francisco | $8,262,203.91 |
| Los Angeles | $5,452,570.80 |
| New York City | $4,664,317.43 |
| Boston | $3,661,642.01 |
| Atlanta | $2,795,498.58 |

**Finding:** San Francisco recorded the highest revenue among the cities in the original analysis, followed by Los Angeles and New York City.

## Sales Analysis Dashboard

The Power BI dashboard presents the sales analysis visually, including revenue, order activity, product performance, and geographic distribution.

![Sales Analysis Dashboard](reports/Sales%20Analysis%20Report.png)

## Business Interpretation and Next Steps

The results suggest that the business should evaluate performance through several complementary measures rather than a single ranking.

- **Demand planning:** Q4 had the most orders, making it a useful period for further investigation of inventory and fulfillment needs. A single year cannot establish a recurring seasonal pattern.
- **Product decisions:** Charging accessories led in order or unit volume, while the MacBook Pro Laptop led in revenue. Prioritization would depend on whether the business aims to improve order volume, revenue, or profitability.
- **Geographic decisions:** San Francisco was the leading city by revenue, but market size, customer counts, and operating costs would be needed before making investment recommendations.

These are business implications to investigate, not demonstrated causes of performance. The SQL results do not include cost data, so they cannot establish product or city profitability.

## Sales Analysis Summary

The analysis showed that:

- Order activity was strongest in the final quarter of 2019, with December recording the highest monthly order count.
- USB-C Charging Cable led in distinct order frequency.
- AAA Batteries (4-pack) led in recorded quantity ordered.
- MacBook Pro Laptop generated the highest product revenue.
- San Francisco led the original city-level revenue comparison.

Together, these findings demonstrate why sales performance should be examined through multiple measures rather than a single sales-volume metric.

---

# Project Two: HR Attrition Analysis

## Project Description

This project examined employee data to understand the distribution of attrition across different workforce characteristics.

The analysis explored employee demographics, job duties, engagement indicators, and organizational factors to identify where recorded employee departures were concentrated.

### Business Task

Analyze the employee dataset to:

- Determine the total workforce and overall attrition rate.
- Examine attrition counts across demographic categories.
- Explore departures by department, job role, and job level.
- Examine recorded leavers across employee engagement measures.
- Explore satisfaction-related characteristics.
- Present the findings through Power BI dashboards.

### Business Questions and Analytical Reasoning

This project asked not only *where departures occurred*, but also *what can responsibly be concluded from the available comparisons*:

1. What proportion of the recorded workforce had left?
2. Which demographic groups, departments, and job levels accounted for the most departures?
3. How were departures distributed across overtime, work-life balance, involvement, and satisfaction measures?
4. Do these distributions establish which employee groups face higher attrition risk, or would additional comparisons be necessary?

I first established the overall workforce and departure count, then examined the characteristics of employees who left. The distinction between a **count of leavers** and an **attrition rate within a subgroup** guided the interpretation throughout.

## SQL Analysis

The SQL analysis covered the overall workforce, attrition status, and employee characteristics using grouped counts and conditional categories.

**SQL file:** [HR Attrition Analysis.sql](analysis_workflow/HR%20Attrition%20Analysis.sql)

### 1. Workforce Overview

**Analytical Question:** What proportion of employees were recorded as having left the organization?

The analysis began by counting the total workforce and examining employee attrition status.

| Workforce Metric | Employee Count |
|---|---:|
| Total Employees | 1,470 |
| Employees Who Left | 237 |
| Employees Who Stayed | 1,233 |
| Overall Attrition Rate | 16.12% |

Of the **1,470 employees** in the dataset, **237** were recorded as having left the organization, producing an overall attrition rate of approximately **16.12%**.

The following sections examine the characteristics of those 237 employees.

### 2. Attrition by Employee Demographics

**Analytical Question:** How were recorded departures distributed across demographic categories?

The analysis examined gender, age groups, marital status, and education fields.

For example, gender-based departures were identified by filtering employees with a recorded attrition status of `Yes` and grouping the results by gender:

```sql
SELECT
    Gender,
    COUNT(*) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Gender
ORDER BY attrition_count DESC;
```

#### Gender

| Gender | Recorded Leavers | Share of Leavers |
|---|---:|---:|
| Male | 150 | 63.3% |
| Female | 87 | 36.7% |

Male employees accounted for a larger share of recorded departures.

However, this comparison alone does not establish whether male employees had a higher attrition rate, because the total number of male and female employees in the workforce was not included in this comparison.

#### Age Group

| Age Group | Recorded Leavers |
|---|---:|
| 18–30 | 100 |
| 31–45 | 103 |
| 46–60 | 34 |

The largest numbers of recorded leavers were in the **31–45** and **18–30** age groups, with 103 and 100 departures, respectively.

#### Marital Status

The original analysis also examined attrition by marital status and gender.

Single employees accounted for the largest number of recorded departures, followed by married and divorced employees.

#### Education Field

| Education Field | Recorded Leavers |
|---|---:|
| Life Sciences | 89 |
| Medical | 63 |
| Marketing | 35 |
| Technical Degree | 32 |
| Other | 11 |
| Human Resources | 7 |

Life Sciences accounted for the largest share of recorded departures, followed by Medical.

### 3. Attrition by Job Characteristics

**Analytical Question:** How were recorded departures distributed across departments, job roles, and job levels?

The SQL analysis grouped employees who left by their department, job role, and job level.

#### Department

| Department | Recorded Leavers |
|---|---:|
| Research & Development | 133 |
| Sales | 92 |
| Human Resources | 12 |

Research & Development accounted for **133 of the 237 recorded departures**, representing approximately **56.1% of leavers**.

Sales accounted for 92 departures, while Human Resources accounted for 12.

These results identify where departures were concentrated, rather than comparing department-specific attrition rates.

#### Job Role

| Job Role | Recorded Leavers |
|---|---:|
| Laboratory Technician | 62 |
| Sales Executive | 57 |
| Research Scientist | 47 |
| Sales Representative | 33 |
| Human Resources | 12 |

Laboratory Technicians and Sales Executives accounted for the highest recorded departure counts among job roles.

#### Job Level

| Job Level | Recorded Leavers |
|---|---:|
| Entry Level | 143 |
| Junior/Associate | 52 |
| Mid Specialist | 32 |
| Senior | 5 |
| Executive | 5 |

Entry-level employees accounted for **143 departures**, or approximately **60.3% of all recorded leavers**.

This was the largest departure count among the job-level categories examined.

### 4. Attrition by Employee Engagement

**Analytical Question:** What engagement and work-related characteristics were recorded among employees who left?

The analysis explored several employee engagement and work-related characteristics, including performance ratings, job involvement, work-life balance, overtime, and distance from home.

#### Performance Rating

| Performance Rating Category | Recorded Leavers |
|---|---:|
| Lower Recorded Rating | 200 |
| Higher Recorded Rating | 37 |

Most recorded leavers belonged to the lower of the two performance-rating categories present in the original SQL output.

#### Work-Life Balance

| Work-Life Balance | Recorded Leavers |
|---|---:|
| Bad | 25 |
| Average | 58 |
| Good | 127 |
| Excellent | 27 |

Employees with a **Good** work-life balance rating accounted for the largest number of recorded departures.

#### Job Involvement

| Job Involvement | Recorded Leavers |
|---|---:|
| Very Low | 28 |
| Low | 71 |
| Moderate | 125 |
| High | 13 |

The **Moderate** job-involvement category accounted for the largest number of recorded departures.

#### Overtime

| Overtime Status | Recorded Leavers |
|---|---:|
| Yes | 127 |
| No | 110 |

Of the 237 recorded leavers, 127 worked overtime and 110 did not.

Although the counts are relatively close, the results alone cannot establish whether overtime affected attrition risk.

### 5. Attrition by Organizational Factors

**Analytical Question:** How were recorded departures distributed across satisfaction categories?

The analysis also examined job satisfaction, environment satisfaction, and relationship satisfaction.

#### Job Satisfaction

| Job Satisfaction | Recorded Leavers |
|---|---:|
| Very Dissatisfied | 66 |
| Dissatisfied | 46 |
| Satisfied | 73 |
| Very Satisfied | 52 |

The **Satisfied** category accounted for the largest number of recorded departures, followed by **Very Dissatisfied**.

#### Environment Satisfaction

| Environment Satisfaction | Recorded Leavers |
|---|---:|
| Very Dissatisfied | 72 |
| Dissatisfied | 43 |
| Satisfied | 62 |
| Very Satisfied | 60 |

The **Very Dissatisfied** category recorded the highest departure count for environment satisfaction.

#### Relationship Satisfaction

| Relationship Satisfaction | Recorded Leavers |
|---|---:|
| Very Dissatisfied | 57 |
| Dissatisfied | 45 |
| Satisfied | 71 |
| Very Satisfied | 64 |

The **Satisfied** category accounted for the largest number of recorded departures for relationship satisfaction.

**Finding:** Recorded departures occurred across both positive and negative satisfaction categories. These distributions are useful for describing the employees who left, but they do not independently justify the influence of satisfaction on attrition.

## HR Analytics Dashboards

Power BI reports were developed to visualize the employee attrition analysis.

### HR Analytics Report — Page 1

![HR Analytics Dashboard Page 1](reports/HR%20Analytics%20Report.1.png)

### HR Analytics Report — Page 2

![HR Analytics Dashboard Page 2](reports/HR%20Analytics%20Report.2.png)

### HR Analytics Report — Page 3

![HR Analytics Dashboard Page 3](reports/HR%20Analytics%20Report.3.png)

The dashboards provide visual summaries of the workforce overview and the employee categories examined in the SQL analysis.

## Business Interpretation and Next Steps

The results help identify areas for further HR investigation, but they should not be interpreted as evidence that particular characteristics caused employees to leave.

- **Workforce planning:** Research & Development and entry-level roles accounted for substantial numbers of departures. Comparing their departures against the total number of employees in each group would establish whether their *rates* were unusually high.
- **Work conditions:** Overtime, job involvement, and work-life balance were examined among leavers. Comparing leavers and non-leavers within each category would provide a stronger basis for understanding potential associations.
- **Employee experience:** Departures occurred across positive and negative satisfaction ratings. Follow-up analysis could calculate category-specific attrition rates before considering retention interventions.

The most useful next step is to calculate subgroup attrition rates using the complete workforce, rather than ranking categories by departure counts alone.

## HR Attrition Analysis Summary

The analysis established an overall employee attrition rate of **16.12%** and explored the distribution of 237 recorded departures.

The highest recorded departure counts were observed among:

- Male employees within the gender comparison.
- Employees aged 31–45 and 18–30.
- Employees in Research & Development.
- Laboratory Technicians and Sales Executives.
- Entry-level employees.
- Employees in the Moderate job-involvement category.

These findings describe patterns within the recorded leaver population. But further analysis using the total workforce in each category would be required to compare group-specific attrition rates and assess possible relationships with employee departures.

---

## What I Learned

These projects strengthened my SQL and Power BI skills, but they also changed how I think about business questions and evidence.

### 1. Choosing a measure that matches the question

The Sales Analysis showed me that **order frequency, quantity ordered, and revenue answer different questions**. A product can appear in many orders without generating the most revenue. I learned to define what “best performing” means before comparing products, rather than relying on one ranking.

### 2. Understanding the denominator before comparing groups

The HR analysis made the difference between **departure counts** and **group-specific attrition rates** especially clear. Research & Development had the most recorded departures, but that alone does not prove employees there were more likely to leave. To make that comparison, I would need the number of employees in each department, including those who stayed.

### 3. Moving from SQL outputs to business reasoning

SQL helped me aggregate orders, revenue, and employee records; Power BI helped me communicate those patterns. The more important lesson was learning to ask what each result means for a business decision. For example, a strong fourth quarter raises useful demand-planning questions, but it does not explain what caused the increase.

### 4. Being careful about what the data can establish

The Sales project does not include the cost information needed to assess profit. The HR subgroup queries describe employees who left, but they do not establish the causes of attrition. I learned that acknowledging these limitations makes an analysis more credible and helps identify the right next question.

Together, the projects reinforced an approach I want to carry into future work: **start with the business problem, choose the right measure, examine the evidence, interpret it carefully, and identify what should be investigated next.**

## Analytical Limitations

- **Sales reporting period:** The SQL queries use `order_date < '2020-01-01'`. The 2019 interpretation assumes the underlying dataset contains no earlier records requiring an additional lower date boundary.
- **Revenue versus profit:** Recorded sales revenue does not account for product costs, marketing expenditure, or operating expenses.
- **HR comparisons:** The overall attrition rate uses the full workforce. Most demographic, job, and satisfaction queries filter to employees who left, so their results are **counts of leavers**, not subgroup-specific attrition rates.
- **Causality:** Neither project establishes why sales changed or why employees left.
- **Reproduction:** The repository documents the SQL and dashboard images, but the original source datasets are not provided here.

## Repository Files

```text
MeriSKILL_Internship_Project/
├── analysis_workflow/
│   ├── HR Attrition Analysis.sql
│   └── Sales Analysis.sql
├── reports/
│   ├── Sales Analysis Report.png
│   ├── HR Analytics Report.1.png
│   ├── HR Analytics Report.2.png
│   └── HR Analytics Report.3.png
└── README.md
```

## Conclusion

These two internship projects provided practical experience in using SQL to investigate business questions and Power BI to communicate analytical findings.

The Sales Analysis project examined how order activity, product performance, revenue, and geographic distribution contributed to the overall sales picture.

The HR Attrition Analysis project examined the distribution of employee departures across workforce characteristics, highlighting the importance of distinguishing descriptive counts from attrition rates.

Together, the projects demonstrate the application of SQL-based exploratory analysis, dashboard development, and evidence-based interpretation to different business datasets.
