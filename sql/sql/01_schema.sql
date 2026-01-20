-- Table: public.fraud_analysis_tableau

-- DROP TABLE IF EXISTS public.fraud_analysis_tableau;

CREATE TABLE IF NOT EXISTS public.fraud_analysis_tableau
(
    transaction_id character varying(50) COLLATE pg_catalog."default",
    customer_id character varying(50) COLLATE pg_catalog."default",
    transaction_date date,
    transaction_hour integer,
    amount_ngn numeric(18,2),
    merchant_name character varying(200) COLLATE pg_catalog."default",
    category character varying(100) COLLATE pg_catalog."default",
    txn_status character varying(20) COLLATE pg_catalog."default",
    risk_score integer,
    ip_address character varying(50) COLLATE pg_catalog."default",
    customer_age integer,
    customer_region character varying(100) COLLATE pg_catalog."default",
    customer_lat numeric(10,6),
    customer_long numeric(10,6),
    device_lat numeric(10,6),
    device_long numeric(10,6),
    fraud_flag integer,
    fraud_category character varying(100) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.fraud_analysis_tableau
    OWNER to postgres;

-- Table: public.customer_fraud_summary

-- DROP TABLE IF EXISTS public.customer_fraud_summary;

CREATE TABLE IF NOT EXISTS public.customer_fraud_summary
(
    customer_id uuid NOT NULL,
    total_txn_count_30d integer,
    fraud_txn_30d_count integer,
    suspicious_event_30d_count integer,
    avg_risk_score_30d numeric(5,2),
    max_risk_score_30d integer,
    total_amount_30d numeric(18,2),
    customer_fraud_status character varying(30) COLLATE pg_catalog."default",
    fraud_severity_score integer,
    fraud_priority_rank integer,
    customer_name character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT customer_fraud_summary_pkey PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer_fraud_summary
    OWNER to postgres;
