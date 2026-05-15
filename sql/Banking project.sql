---ANALYTICAL SQL QUERIES---

--Customer segmentation--
-- 1)Demographic: Occupation Segmentation--

SELECT occupation, COUNT(customer_id) AS no_of_customers
FROM dim_customers
GROUP BY occupation
ORDER BY no_of_customers DESC;

SELECT MIN(opening_balance) AS minimum, MAX(opening_balance) AS maximum, AVG(opening_balance) AS average
FROM dim_accounts

--2) Account Balance Segmentation--

SELECT 
	CASE 
		WHEN opening_balance >= 700000 THEN 'High Value'
		WHEN opening_balance >= 500000 THEN 'Medium Value'
		ELSE 'Low Value'
	END AS customer_segment,
	COUNT (*) AS total_customers
FROM dim_accounts
GROUP BY customer_segment

---Transaction Behavior Analysis---

-- 1) Customers with highest numbers of transactions--
SELECT customer_id, 
	COUNT(transaction_id) AS total_transactions,
	ROUND(SUM(transaction_amount)::numeric, 2) AS total_amount
FROM fact_transactions
GROUP BY customer_id
ORDER BY total_amount DESC;

--2) Identifying customers with signifiant transaction amounts--

SELECT customer_id,
       transaction_amount,
       RANK() OVER (ORDER BY transaction_amount DESC) AS transaction_rank
FROM fact_transactions;

--Loan Analysis--

--1) Default risk patterns--
SELECT repayment_status,
	   COUNT (*) AS total_loans,
	   AVG(loan_amount) AS avg_loan
FROM fact_loans
GROUP BY repayment_status

--2)Customers inactive for more than 120 days--
SELECT customer_id,
	MAX (transaction_date::date) AS last_transaction_date
FROM fact_transactions
GROUP BY customer_id
HAVING MAX(transaction_date::date) < CURRENT_DATE - INTERVAL '90 days'

---Risk/Fraud Detection---
--1) Multiple transactions within 1 hour --

SELECT 
    customer_id,
    transaction_id,
    transaction_date,
    transaction_amount,
    previous_transaction_time,
    transaction_date::timestamp - previous_transaction_time AS time_difference
FROM (
    SELECT 
        customer_id,
        transaction_id,
        transaction_date,
        transaction_amount,
        LAG(transaction_date::timestamp) OVER (
            PARTITION BY customer_id
            ORDER BY transaction_date::timestamp 
        ) AS previous_transaction_time
    FROM fact_transactions
    WHERE transaction_type = 'Withdrawal'
) 
WHERE transaction_date::timestamp - previous_transaction_time::timestamp <= INTERVAL '1 hour'

-- 2) Extremely large transactions --
SELECT customer_id,
       transaction_amount,
       transaction_date
FROM fact_transactions
WHERE transaction_amount > 4500000;

--- PRODUCT USAGE ANALYSIS---
-- 1) Customers with multiple accounts --

SELECT customer_id,
       COUNT(account_id) AS number_of_accounts
FROM dim_accounts
GROUP BY customer_id
ORDER BY number_of_accounts DESC;


