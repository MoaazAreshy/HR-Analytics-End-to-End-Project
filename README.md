# HR Analytics Dashboard

## Project Overview

This project presents an end-to-end HR Analytics solution designed to transform raw employee data into actionable business insights.

The goal is to help HR teams and decision-makers answer critical workforce questions such as:

* Why are employees leaving the company?
* Which departments experience the highest turnover?
* Which recruitment sources attract the most valuable employees?
* Are there salary gaps across departments and genders?
* Which managers retain employees most effectively?

The project covers the complete analytics workflow, from data cleaning and transformation to database modeling and interactive dashboard development.

---

## Business Questions

This project focuses on answering the following business questions:

1. Which department has the highest turnover rate?
2. What are the main reasons employees leave the company?
3. Which manager has the highest team turnover?
4. Is there a gender pay gap across departments?
5. Which recruitment source brings the best employees?
6. How does employee performance vary across the organization?
7. What trends exist in hiring and termination activities over time?

---

## Project Workflow

### 1. Data Cleaning & Preparation (Python)

The raw dataset contained several data quality issues, including:

* Incorrect birth date values
* Missing termination dates
* Inconsistent department names
* Missing manager relationships

Data cleaning and preprocessing were performed using Python and Pandas.

### Feature Engineering

Additional analytical fields were created:

* Age
* Age Group
* Tenure Years
* Is Active
* Days Since Last Review

---

### 2. Database Design (SQL Server)

After cleaning, the dataset was loaded into SQL Server.

A Star Schema model was designed to improve analytical performance and support reporting requirements.

#### Fact Table

* HR_Fact_Table

#### Dimension Tables

* Dim_Employee
* Dim_Department
* Dim_Position
* Dim_Performance
* Dim_RecruitmentSource

Additionally, multiple SQL queries were developed to answer key HR business questions.

---

### 3. Dashboard Development (Power BI)

An interactive dashboard was developed using Power BI and DAX.

### Dashboard Pages

#### Workforce Overview

Provides a high-level view of the workforce including:

* Employee count
* Department distribution
* Demographics overview
* Active vs Terminated employees

#### Turnover & Retention

Analyzes employee exits and retention patterns:

* Turnover rate
* Termination reasons
* Turnover by manager
* Turnover by department

#### Workforce Profile

Focuses on employee characteristics and performance:

* Performance ratings
* Salary analysis
* Gender pay gap
* Absence analysis

#### Hiring & Recruitment

Evaluates recruitment effectiveness:

* Recruitment source performance
* Retention by source
* Satisfaction by source
* Hiring trends

---

## Key Insights

### Employee Referral Delivers the Best Retention

Employees hired through referrals achieved the highest retention rate at 83.9%.

### Turnover Concentration

One manager recorded a team turnover rate of 61.9%, indicating a potential management-related issue.

### Main Reason for Employee Exit

The most common termination reason was employees leaving for another position.

### Strong Overall Performance

More than 90% of employees received Fully Meets or Exceeds performance ratings.

### Gender Pay Gap

A salary gap was identified within the IT/IS department.

### Hiring vs Turnover Trend

2011 recorded the highest hiring volume while also experiencing the highest number of employee exits.

---

## Tools & Technologies

* Python
* Pandas
* SQL Server
* Power BI
* DAX
* Star Schema Modeling

---

## Repository Structure

```text
HR-Analytics-Project/
│
├── Data/
├── Python/
├── SQL/
├── PowerBI/
├── Images/
└── README.md
```

## Author

Moaaz Areshy

Data Analyst

LinkedIn: (https://www.linkedin.com/in/moaaz-ali-36238b2aa/)
