/* =========================================================
   CUSTOMER-LEVEL FRAUD AGGREGATION (LAST 30 DAYS)
   ========================================================= */

WITH recent_transactions AS (
    SELECT
        customer_id,
        transaction_id,
        transaction_date,
        amount_ngn,
        risk_score,
        fraud_flag,
        high_value_flag,
        midnight_flag,
        high_risk_flag
    FROM public.fraud_analysis_tableau
    WHERE transaction_date >= CURRENT_DATE - INTERVAL '30 days'
),

customer_metrics AS (
    SELECT
        customer_id,

        COUNT(transaction_id) AS total_txn_count_30d,

        SUM(fraud_flag) AS fraud_txn_30d_count,

        SUM(
            high_value_flag +
            midnight_flag +
            high_risk_flag
        ) AS suspicious_event_30d_count,

        ROUND(AVG(risk_score), 2) AS avg_risk_score_30d,

        MAX(risk_score) AS max_risk_score_30d,

        SUM(amount_ngn) AS total_amount_30d

    FROM recent_transactions
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_txn_count_30d,
    fraud_txn_30d_count,
    suspicious_event_30d_count,
    avg_risk_score_30d,
    max_risk_score_30d,
    total_amount_30d,

    /* Fraud severity scoring */
    (
        fraud_txn_30d_count * 5 +
        suspicious_event_30d_count * 2 +
        CASE
            WHEN max_risk_score_30d >= 90 THEN 10
            WHEN max_risk_score_30d >= 80 THEN 5
            ELSE 0
        END
    ) AS fraud_severity_score,

    /* Investigator priority ranking */
    RANK() OVER (
        ORDER BY
            fraud_txn_30d_count DESC,
            suspicious_event_30d_count DESC,
            max_risk_score_30d DESC
    ) AS fraud_priority_rank

FROM customer_metrics;
