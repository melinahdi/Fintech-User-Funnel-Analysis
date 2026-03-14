CREATE TABLE datamart_funnel_country AS
SELECT
    c.country_name,
    
    COUNT(DISTINCT CASE WHEN e.event_name='app_install' THEN f.user_id END) app_installs,
    COUNT(DISTINCT CASE WHEN e.event_name='sign_up' THEN f.user_id END) signups,
    COUNT(DISTINCT CASE WHEN e.event_name='kyc_completed' THEN f.user_id END) kyc_completed,
    COUNT(DISTINCT CASE WHEN e.event_name='first_transaction' THEN f.user_id END) first_transaction
    
FROM fact_user_events f
JOIN dim_event_type e ON f.event_type_id=e.event_type_id
JOIN dim_location l ON f.location_id=l.location_id
JOIN dim_country c ON l.country_id=c.country_id
GROUP BY c.country_name;


CREATE TABLE datamart_funnel_device AS
SELECT
    d.device_type,
    d.os,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'app_install' 
        THEN f.user_id END) AS installs,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'sign_up' 
        THEN f.user_id END) AS signups,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'kyc_completed' 
        THEN f.user_id END) AS kyc_completed,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'first_transaction' 
        THEN f.user_id END) AS first_transaction

FROM fact_user_events f
JOIN dim_event_type e 
    ON f.event_type_id = e.event_type_id
JOIN dim_device d 
    ON f.device_id = d.device_id

GROUP BY
    d.device_type,
    d.os;

CREATE TABLE datamart_funnel_month AS
SELECT
    d.year,
    d.month,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'app_install'
        THEN f.user_id END) AS installs,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'sign_up'
        THEN f.user_id END) AS signups,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'kyc_completed'
        THEN f.user_id END) AS kyc_completed,

    COUNT(DISTINCT CASE 
        WHEN e.event_name = 'first_transaction'
        THEN f.user_id END) AS first_transaction

FROM fact_user_events f
JOIN dim_event_type e
    ON f.event_type_id = e.event_type_id
JOIN dim_date d
    ON f.date_id = d.date_id

GROUP BY
    d.year,
    d.month
ORDER BY
    d.year,
    d.month;

CREATE TABLE datamart_ttft AS
SELECT
    u.user_id,
    u.registration_date,
    MIN(d.date) AS first_transaction_date,
    MIN(d.date) - u.registration_date AS days_to_first_transaction
FROM fact_user_events f
JOIN dim_event_type e
    ON f.event_type_id = e.event_type_id
JOIN dim_user u
    ON f.user_id = u.user_id
JOIN dim_date d
    ON f.date_id = d.date_id
WHERE e.event_name = 'first_transaction'
GROUP BY
    u.user_id,
    u.registration_date
HAVING MIN(d.date) >= u.registration_date;

CREATE TABLE datamart_returning_user AS
SELECT user_id,
	   MIN(d.date) AS first_visit,
	   COUNT(DISTINCT f.date_id) as active_days,
	   CASE
	   	WHEN count(DISTINCT f.date_id) > 1
	   	THEN 'returning user'
	   	ELSE 'new user'
	   	END AS user_type
FROM fact_user_events f
JOIN dim_date d
ON f.date_id = d.date_id 
GROUP BY user_id;

CREATE TABLE datamart_active_user AS 
SELECT f.* FROM fact_user_events f
JOIN dim_date d
ON f.date_id = d.date_id 
WHERE d.month > 9;








