# DataCo Smart Supply Chain Analytics & Executive Insights

**Group Code:** `YAT792A_CAI5_DAT1_S2` | **Team 3**

An end-to-end Power BI and SQL Server Business Intelligence solution analyzing global retail supply chain operations across executive performance, customer profitability, order fulfillment, product catalogs, and shipping logistics.

This project transforms over 180K+ raw operational order rows (2015–2018 across 5 global markets) into actionable business intelligence through Excel and Power Query ETL cleaning, SQL Server relational modeling, star-schema architecture, dynamic DAX measures, and bookmark-driven interactive reporting.

The solution consists of five analytical report pages supported by a dedicated Landing Page navigation hub, embedded Key Insights, and strategic recommendations. Throughout development, this repository served as our central collaborative workspace for sharing datasets, SQL scripts, and individual dashboard modules before consolidating everything into the final deliverable.

---

## Dashboard Overview

The solution includes a dedicated Landing Page and five analytical report pages, each equipped with a collapsible bookmark-driven Filter Drawer (`Filters`), conditional KPI reference labels, and embedded Key Insights & Recommendations:

### 1. Executive Summary
* **Purpose:** Monitor overall business performance, regional concentration, and high-level operational health.
* **Key Metrics & Analysis:**
  * **Core KPIs:** **$30.82M** Total Sales (+29.0% YoY), **$3.69M** Total Profit (+29.5% YoY), **57K** Total Orders (**172K** Items Sold), **$537.75** Avg Order Value (+1.1% YoY), and **11.97%** Profit Margin (+0.4% YoY).
  * **Regional & Category Mix:** Sales by Market (**LATAM** $9.2M and **Europe** $8.7M lead global revenue, followed by Pacific Asia, USCA, and Africa) and Top Performing Departments (**Fan Shop** leads with ~50% of revenue).
  * **Segment & Delivery Breakdown:** Sales & Margin by Customer Segment (**Consumer** 51.89%, **Corporate** 30.31%, **Home Office** 17.79%) and Delivery Status Breakdown across shipping modes.
* **Business Value:** Gives stakeholders a consolidated view of top-line expansion while flagging category reliance and express shipping bottlenecks.

### 2. Customer Operations Performance Analysis
* **Purpose:** Evaluate customer retention, account profitability, and segment contribution.
* **Key Metrics & Analysis:**
  * **Core KPIs:** **12K** Total Customers (+1.5% YoY), **96.32%** Repeat Customer Rate (+6.1% YoY), **$302.09** Avg Profit Per Customer (+27.6% YoY), **$2.52K** Avg Sales Per Customer (+27.1% YoY), and **4.69** Avg Orders Per Customer (+25.7% YoY).
  * **Profitability & Geographic Distribution:** Customer Sales & Profitability scatter plot, US geographic distribution map, and Customer Segment Profitability (**Corporate** holds the highest profit margin at **12.01%**, ahead of Consumer at 11.97% and Home Office at 11.91%).
  * **Account-Level Audit:** Customer Performance Overview table identifying high-sales buyers with negative profit margins (e.g., Mary Smith at -9.18%), Department Sales by Customer Segment, and Order Status Distribution by Segment.
* **Business Value:** Helps identify loyal high-value accounts, protect margins on unprofitable high-revenue customers, and target Corporate growth opportunities.

### 3. Orders & Fulfillment Performance Analysis
* **Purpose:** Analyze order volume stability, discount tier profitability, and payment risk.
* **Key Metrics & Analysis:**
  * **Core KPIs:** **21K** Total Orders (selected period), **$550.41** Avg Order Value (+4.0% YoY), **3.50 Days** Order Cycle, **2.07%** Order Cancellation Rate (-0.8% YoY), and **98.72%** Discounted Orders %.
  * **Discount & Payment Profitability:** Discount Profitability analysis revealing that **1–10% discounts maximize order profit** ($34.4 avg profit in 1–5%, $34.3 in 6–10%), whereas deep **21–25% discounts** erode order profit down to $22.5. Payment Type Profitability shows **CASH** posts the highest margin (~12.40%–12.83%), while **TRANSFER** accounts for the concentration of canceled and suspected-fraud orders.
  * **Volume Trends:** Orders per Department, global Orders Distribution map, monthly order trends, and Orders by Status.
* **Business Value:** Establishes an optimal 1–10% promotional discount cap and isolates payment fraud risk in TRANSFER transactions.

### 4. Product, Category & Department Performance Analysis
* **Purpose:** Evaluate catalog concentration, category margins, and product-level fulfillment delays.
* **Key Metrics & Analysis:**
  * **Core KPIs:** **118** Total Products, **20%** Top Product Contribution, **20%** Leading Category Share, **$114.17K** Avg Sales per Product, and **100%** Availability Rate.
  * **Category & Department Performance:** Top Products by Sales & Profit, Top 8 Categories by Sales (**Fishing** leads at **$2.27M** with 12.41% margin, followed by **Cleats** at **$1.44M** with 13.09% margin), and Department Sales & Profitability (**Fitness** leads margin at **13.48%**, followed by **Outdoors** at **12.52%**, while Footwear trails at 11.41%).
  * **Fulfillment Drag:** Delivery Performance Share across top products showing late-delivery rates between **54.34% and 57.92%** (peaking at 57.92% for ENO Atlas Hammock Straps).
* **Business Value:** Guides inventory prioritization toward high-margin Fitness and Outdoors lines while pinpointing top-selling SKUs held back by shipping delays.

### 5. Shipment Performance Analysis
* **Purpose:** Diagnose delivery delays, evaluate shipping mode SLAs, and track seasonal reliability.
* **Key Metrics & Analysis:**
  * **Core KPIs:** **21K** Total Shipments, **9K** On-Time & Early Shipments (41%), **11K** Late Deliveries (**54.61%** late rate), **907** Canceled Shipments (**4.37%**), and **3.50** Actual Avg Delivery Days vs. **2.93** Scheduled Days.
  * **Shipping Mode SLA Gap:** **Standard Class** carries **59.8%** of volume with the lowest late rate (**38.1%**), whereas **First Class** suffers a **95.3%** late rate (promised in 1 day, delivered in 2 days) and **Second Class** averages 4.0 actual days vs. 2.0 scheduled days.
  * **Time-Series Reliability:** Monthly best/worst performing months and quarterly late delivery trends confirming a flat structural bottleneck (54.5%–55.2% annually) rather than seasonal spikes.
* **Business Value:** Pinpoints unrealistic express SLAs as the primary driver of lateness and provides concrete targets to recalibrate First Class and Second Class delivery promises.

---

## Strategic Recommendations

1. **Overhaul Express Shipping SLAs:** Reset First Class delivery promises from 1 day to 2 days and Second Class from 2 days to 4 days, while steering volume toward Standard Class to cut the 54.61% late-delivery rate.
2. **Cap Promotional Discounts at 1–10%:** Eliminate deep 21–25% discounts that erode average order profit from $34.4 down to $22.5.
3. **Audit TRANSFER Payment Risk:** Implement pre-fulfillment verification and risk scoring on TRANSFER orders to reduce cancellations and suspected fraud.
4. **Scale High-Margin Categories & Corporate Accounts:** Expand Fitness (13.48% margin) and Outdoors (12.52% margin) product mixes alongside tailored bulk contracts for Corporate buyers (12.01% margin).

---

## Data Modeling & Star Schema Architecture

The data model follows a clean **Star Schema** centered on `Fact_Orders` connected via 1-to-Many single-direction relationships to six dimension tables, including a role-playing `Dim_Date` relationship (active on Order Date, inactive on Shipping Date).

### Fact Table
| Table Name | Analytical Purpose |
| :--- | :--- |
| `Fact_Orders` | Central transaction table capturing sales, profit per order, quantities, discount amounts, discount tiers, order status groups, and foreign keys. |

### Dimension Tables
| Table Name | Description |
| :--- | :--- |
| `Dim_Customer` | Customer IDs, names, segments (Consumer, Corporate, Home Office), cities, states, countries, and zip codes. |
| `Dim_Product` | Product catalog IDs, product names, unit prices, availability flags, and category mappings. |
| `Dim_Department` | Organizational department IDs and names (Fan Shop, Apparel, Golf, Footwear, Outdoors, Fitness). |
| `Dim_Location` | Global markets (LATAM, Europe, Pacific Asia, USCA, Africa), regions, countries, states, cities, and coordinates. |
| `Dim_Shipment` | Shipment IDs, shipping modes (Standard Class, Second Class, First Class, Same Day), delivery status, and scheduled vs. actual shipping days. |
| `Dim_Date` | Calendar dates, months, month-year labels, quarters, and time-intelligence attributes. |

### Model Structure Diagram
```text
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ Dim_Shipment │     │ Dim_Product  │     │ Dim_Customer │
└──────┬───────┘     └──────┬───────┘     └──────┬───────┘
       │ 1                  │ 1                  │ 1
       │                    │                    │
       └──────────────┬─────┴─────┬──────────────┘
                      │ *         │ *
                      ▼           ▼
                ┌───────────────────────┐
                │      Fact_Orders      │
                └───────────────────────┘
                      ▲           ▲
       ┌──────────────┼─────┬─────┼──────────────┐
       │ *            │ *   │ *   │ *            │ *
       │ 1            │ 1   │ 1   │ 1            │ 1
┌──────┴───────┐     ┌┴─────┴─────┴┐     ┌───────┴────────┐
│ Dim_Location │     │   Dim_Date  │     │ Dim_Department │
└──────────────┘     └─────────────┘     └────────────────┘
```

---

## Tools & Technologies
* **Excel & Power Query:** Data cleaning, standardized English country mapping, null/duplicate handling, and ETL preparation.
* **SQL Server:** Relational database storage, schema setup, and analytical querying.
* **Dimensional Data Modeling:** Star schema architecture with `Fact_Orders`, six dimension tables, and role-playing date logic.
* **DAX:** Custom measures for YoY variance, profit margins, repeat customer rates, late delivery risk, and conditional KPI reference labels.
* **Power BI:** Multi-page interactive reporting, custom dark-navy theme, and bookmark-driven collapsible filter panels.

---

## Deliverables & Links
* **Final Power BI Dashboard (`.pbix`):** [Download from Google Drive](https://drive.google.com/file/d/1j0FFgpk5jBDSVZwR07xHaxBEq8DkG8wF/view?usp=sharing) *(also stored in this repository)*
* **Project Planning & Documentation:** [View PDF](https://drive.google.com/file/d/1gehVWrU__RMc8P1y3VGpbGZvxMJL1bjT/view?usp=sharing)
* **Presentation Slides & Video Demonstration:** [Google Drive Folder](https://drive.google.com/drive/folders/1Q2OnXdihaPU0l3yRjO6elgd5W3s2Rjrt?usp=sharing)

---

## Project Structure
```text
Smart_Supply_chain_data_analysis/
│
├── README.md
├── DataCo_Supply_Chain_Dashboard.pbix
│
└── Images/
    ├── Landing Page.jpg
    ├── Executive Summary.png
    ├── Customer Analysis.png
    ├── Order Analysis.png
    ├── Product Analysis.png
    └── Shipment Tracking.png
```

---

## Dashboard Preview

### Landing Page
The main navigation hub providing direct one-click access to all five analytical report pages.
![Landing Page](Images/Landing%20Page.jpg)

### Executive Summary
Provides a high-level view of financial performance ($30.82M sales, $3.69M profit), regional market leaders, customer segments, and delivery status breakdowns.
![Executive Summary](Images/Executive%20Summary.png)

### Customer Operations Performance Analysis
Analyzes customer retention (96.32% repeat rate), segment profitability, geographic distribution, and account-level margin leakage.
![Customer Analysis](Images/Customer%20Analysis.png)

### Orders & Fulfillment Performance Analysis
Evaluates order cycles (3.50 days), payment type margins, and the profitability impact across discount tiers.
![Orders Analysis](Images/Order%20Analysis.png)

### Product, Category & Department Performance Analysis
Examines catalog scale (118 products), top-performing categories (Fishing and Cleats), department margins, and SKU-level late delivery rates.
![Product Analysis](Images/Product%20Analysis.png)

### Shipment Performance Analysis
Diagnoses the 54.61% late delivery rate across shipping modes, comparing scheduled vs. actual transit days and quarterly trends.
![Shipment Tracking](Images/Shipment%20Tracking.png)

---

## Team Contributions (`YAT792A_CAI5_DAT1_S2` — Team 3)
* **Wissam Safwat (Team Leader):** Project management, task distribution, data cleaning, Executive Summary page, and video demonstration.
* **Ganna Mohamed:** SQL Server database setup & queries, data cleaning, main dashboard layout, and Customer Analysis page.
* **Marwan Hatem:** Data cleaning, Orders Analysis page, and consolidating/linking all dashboard modules into the final Power BI file.
* **Rahma Ashraf:** Data cleaning, Shipment Tracking page, and project documentation.
* **Yasmen Yousri:** Data cleaning, Product Analysis page, and presentation PDF.
