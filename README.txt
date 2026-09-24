# Healthcare Content & Search Trend Analytics

## Project Overview

A data analytics project developed during my Data Analyst internship at iCareHeal Healthtech Pvt. Ltd.

The project analyzes healthcare search trends and content-performance data to identify high-interest topics, specialty-level demand, content-format performance, and potential content opportunities.

The project focuses on business analytics and business intelligence using SQL, Python, Google Trends, Excel, and Power BI.

---

## Business Problem

Healthcare platforms generate content across multiple medical specialties, topics, keywords, and content formats.

The key challenges were:

- Identifying topics with higher search interest
- Understanding which content formats receive better engagement
- Comparing performance across healthcare specialties
- Understanding search-interest and content-performance patterns
- Identifying potential topics for future content planning

### Key Business Question

**What healthcare topics and content formats should be prioritized based on search interest and audience engagement?**

---

## Project Objectives

- Analyze healthcare search trends
- Identify high-interest healthcare topics
- Compare content performance across formats
- Analyze specialty-level performance
- Calculate and analyze engagement metrics
- Study search-interest and content-engagement patterns
- Build an interactive Power BI dashboard
- Generate data-driven insights for content planning

---

## Data Sources

The project uses three main datasets:

### 1. Search Trends Dataset

Contains:

- Date
- Specialty
- Topic
- Keyword
- Search Interest
- Trend Growth %
- Region

Search Interest represents relative search interest rather than absolute search volume.

### 2. Content Performance Dataset

Contains:

- Post ID
- Date
- Doctor ID
- Specialty
- Topic
- Content Type
- Reach
- Likes
- Comments
- Shares
- Saves
- Engagement Rate
- CTA

### 3. Doctor Dataset

Contains:

- Doctor ID
- Specialty
- City

---

## Data Preparation

The datasets were prepared before analysis by:

- Checking missing values
- Checking duplicate records
- Standardizing categorical values
- Cleaning column names
- Validating data types
- Creating calculated engagement metrics
- Preparing datasets for SQL, Python and Power BI analysis

### Engagement Rate

Engagement Rate was calculated as:

Engagement Rate = 
(Likes + Comments + Shares + Saves) / Reach × 100

---

## Analytics Workflow

```text
Data Collection
       ↓
Data Cleaning & Preparation
       ↓
Excel Exploration
       ↓
SQL Analysis
       ↓
Python EDA
       ↓
Google Trends Analysis
       ↓
Power BI Visualization
       ↓
Business Insights
