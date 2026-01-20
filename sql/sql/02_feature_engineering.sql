-- Feature Engineering for Fraud Signals
-- Derives behavioral and risk indicators from transaction data

CREATE OR REPLACE VIEW fraud_features AS
SELECT
    transaction_id,
    customer_id,
    transaction_date,
    amount_ngn,
    merchant_name,
    category,
    risk_score,
    ip_address,
    fraud_flag,
    fraud_category,

    /* High value transaction flag */
    CASE 
        WHEN amount_ngn >= 500000 THEN 1 ELSE 0 
    END AS high_value_flag,

    /* Midnight transaction flag */
    CASE 
        WHEN transaction_hour BETWEEN 0 AND 4 THEN 1 ELSE 0 
    END AS midnight_flag,

    /* High risk score flag */
    CASE 
        WHEN risk_score >= 85 THEN 1 ELSE 0 
    END AS high_risk_flag

FROM fraud_analysis_tableau;
