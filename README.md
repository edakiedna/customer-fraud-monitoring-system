# customer-fraud-monitoring-system
End-to-end fraud detection, risk scoring, and investigation system built with PostgreSQL and Tableau.

# Project Overview

This project simulates a **real-world financial fraud detection and investigation system**, designed to identify suspicious customers, prioritize investigations, and uncover fraud networks using **PostgreSQL (SQL)** and **Tableau**.

The solution follows an **industry-standard analytics architecture**:

 **SQL** → fraud logic, aggregation, scoring, ranking
 **Tableau** → monitoring, investigation, storytelling

The core business question answered:

**Who should be monitored, reviewed, investigated, or confirmed as fraud — and why?**


# Business Objectives

 Detect potentially fraudulent behavior at **transaction level**
 Aggregate risk signals to **customer level**
 Assign **investigation priorities**
 Support fraud analysts with actionable dashboards
 Reveal fraud rings, shared IPs, and location mismatches

#  Data Architecture

# 1️. Transaction-Level Fraud Table

**Table:** 'fraud_analysis_tableau'

This table represents raw transactional activity enriched with fraud signals.

**Key Fields**

 transaction_id
 customer_id
 transaction_date, transaction_hour
 amount_ngn
 merchant_name, category
 risk_score
 fraud_flag
 fraud_category
 ip_address
 customer_lat, customer_long
 device_lat, device_long
 customer_region

 **Purpose:**
Used for **trend analysis, fraud signals, geospatial analysis, and network detection**.


# 2️. Customer-Level Fraud Summary

**Table:** 'customer_fraud_summary'

This table aggregates 30-day behavior **per customer**.

**Key Fields**

 customer_id
 total_txn_count_30d
 fraud_txn_30d_count
 suspicious_event_30d_count
 avg_risk_score_30d
 max_risk_score_30d
 total_amount_30d
 customer_fraud_status
 fraud_severity_score
 fraud_priority_rank
 customer_name

 **Purpose:**
Single source of truth for **who fraud analysts should act on**.


# Fraud Logic & Scoring (SQL-Driven)

All fraud decisions are computed **inside PostgreSQL**, not Tableau.

# Fraud Status Classification Logic

```sql
CASE
    WHEN fraud_txn_30d_count >= 3
         AND max_risk_score_30d >= 90
    THEN 'CONFIRMED_FRAUD'

    WHEN fraud_txn_30d_count >= 2
         AND max_risk_score_30d BETWEEN 59 AND 89
    THEN 'INVESTIGATE'

    WHEN suspicious_event_30d_count >= 3
         OR avg_risk_score_30d BETWEEN 60 AND 84
    THEN 'REVIEW'

    ELSE 'MONITOR'
END
```

### Why This Is Realistic

| Status              | Meaning                                  |
| ------------------- | ---------------------------------------- |
| **MONITOR**         | Normal customers, low risk               |
| **REVIEW**          | Weak or noisy fraud signals              |
| **INVESTIGATE**     | Strong patterns requiring analyst action |
| **CONFIRMED_FRAUD** | Proven repeat fraud behavior             |

 This ensures **confirmed fraud remains rare**, as expected in real financial systems.



#  Customer Ranking & Prioritization

Customers are ranked using:

* Fraud frequency
* Risk score severity
* Suspicious behavior density

```sql
NTILE(100) OVER (ORDER BY avg_risk_score_30d) AS risk_percentile
```

 **Outcome:**
Fraud teams can focus on **top-risk customers first**, not raw transaction volume.


# Tableau Dashboards

# 1️ Executive Overview Dashboard

**Purpose:** High-level fraud monitoring

 Fraud action distribution (Pie chart)
 Fraud trend over time
 KPI cards (fraud rate, confirmed fraud count, investigation queue)


# 2️⃣ Customer Risk & Investigation Queue

**Purpose:** Analyst-ready customer list

 Ranked customer table
 Fraud status
 Risk metrics
 Drill-down via tooltips

Answers:

 *Who should investigators focus on today?*



# 3️ Geospatial Device & Customer Risk

**Purpose:** Detect location anomalies

 Customer home vs device location
 Cross-border transactions
 Heatmaps by fraud severity


# 4️⃣ Network & Fraud Rings

**Purpose:** Reveal coordinated fraud

 Shared IP addresses
 Multiple customers per IP
 Fraud rings visualized by status


#  Tools & Technologies

 **PostgreSQL (pgAdmin)** — data modeling, fraud logic, ranking
 **Tableau Public** — visualization & dashboards
 **SQL (CTEs, window functions, CASE logic)**
 **GitHub** — version control & documentation


# 📁 Repository Structure

```
fraud-detection-project/
│
├── sql/
│   ├── schema.sql
│   ├── fraud_logic.sql
│   ├── customer_summary.sql
│
├── tableau/
│   ├── fraud_overview.twbx
│   ├── customer_investigation.twbx
│
├── screenshots/
│   ├── overview_dashboard.png
│   ├── investigation_queue.png
│   ├── fraud_network.png
│
└── README.md
```


#  Key Takeaways

 Demonstrates **real-world fraud analytics thinking**
 Separates **data engineering (SQL)** from **analytics (Tableau)**
 Focuses on **customer-level decisions**, not raw noise
 Built to support **fraud analysts, risk teams, and executives**


# 👤 Author

**[EDNA IYORE EDAKI]**
Data Analyst | Fraud Analytics | SQL | Tableau

 Open to fraud analytics & risk intelligence roles


# 🔗 Live Dashboard
(https://public.tableau.com/app/profile/edna.edaki/viz/CustomerFraudMonitoringActionDashboard/Dashboard1?publish=yes)


