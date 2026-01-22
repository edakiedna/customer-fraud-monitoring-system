
```markdown
# Tableau Dashboards – Fraud Monitoring System

This folder contains Tableau dashboards used for monitoring customer fraud risk,
investigation prioritization, geospatial risk analysis, and network fraud detection.


```
## 1. Overview Dashboard

![Overview Dashboard](documentation/screenshots/overview_dashboard.png)

### Business Objective
Provide executives and fraud managers with a real-time snapshot of fraud exposure,
risk distribution, and dominant fraud signals.
```

### Key Insights Enabled
- Identify dominant fraud patterns (e.g. shared IP rings, location mismatch)
- Track fraud growth or decline over time
- Understand proportion of customers under monitoring vs investigation


## 2. Customer Risk & Investigation Queue Dashboard

```markdown
## 2. Customer Risk & Investigation Queue Dashboard

![Customer Risk Investigation Queue](documentation/screenshots/investigation_queue.png)

### Business Objective
Support fraud analysts by prioritizing customers requiring investigation based on
risk severity and recent suspicious behavior .
```

### Analyst Actions Supported
- Identify high-risk customers instantly
- Decide which customers to investigate first
- Reduce investigation backlog


## 3. Geospatial & Device Risk Dashboard

```markdown
## 3. Geospatial & Device Risk Dashboard

![Location_Fraud_map](documentation/screenshots/geo_device_risk_map.png)

### Interpretation
Customer and device locations differ due to VPN usage, proxy routing,
and remote fraud operations.
```

### Business Objective
Detect anomalies between customer home locations and transaction/device locations.

### Key Visuals
- Customer Home Location Fraud Map
- Device Location Fraud Map

### Fraud Patterns Detected
- Location mismatch fraud
- Cross-border device abuse
- Shared device risk clusters

### Important Note
Device and customer locations may differ due to:
- VPN usage
- Proxy routing
- Compromised devices
- Fraud rings operating remotely


## 4. Network & Fraud Rings Dashboard

```markdown
## 4. Network & Fraud Rings Dashboard

![Network & Fraud Rings](documentation/screenshots/network_fraud_rings.png)

### Fraud Indicators
- Shared IP usage across multiple customers
- Mixed fraud statuses within same IP address
```
### Business Objective
Expose coordinated fraud activities using shared IP addresses and network behavior.

### Key Visuals
- IP Address vs Customer ID Heatmap
- Customer Fraud Status Distribution by IP
- Distinct Customer Count per IP

### Fraud Indicators
- High number of customers sharing same IP
- Mixed fraud statuses within same IP block
- Repeated suspicious access patterns


## Fraud Status Color Logic
- 🟢 Monitor
- 🟡 Review
- 🟠 Investigate
- 🔴 Confirmed Fraud
```
