-- Question 2: 
SELECT channel, COUNT (*) as ca_number
FROM credit_strategy_playground.new_starter_training_table1 
WHERE channel IS NOT NULL
GROUP BY channel;

-- Question 3: 
SELECT borrower_type, COUNT (*) as ca_number
FROM credit_strategy_playground.new_starter_training_table1 
WHERE borrower_type IS NOT NULL
GROUP BY borrower_type;

-- Question 4: 
-- By month: 
SELECT 
DATE_TRUNC('month', CAST("fully_submit_date" as date)) as fs_month, 
COUNT (*) AS num_apps
FROM "new_starter_training_table1"
GROUP BY 1
ORDER BY 1;

-- By quarter

SELECT 
DATE_TRUNC('quarter', CAST("fully_submit_date" as date)) as fs_month, 
COUNT (*) AS num_apps
FROM "new_starter_training_table1"
GROUP BY 1
ORDER BY 1;

-- question 5 which company has the most number of applications ever? Which company has the most number of applications in each of 2016,2017,2018,2019, 2020?
WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE YEAR(created_date) BETWEEN 2016 AND 2020
AND company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)
)
SELECT
company_uuid,
count
FROM counted_data 
ORDER BY count DESC 
LIMIT 1;

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE YEAR(created_date) BETWEEN 2016 AND 2020
AND company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date))
SELECT company_uuid, year, count 
FROM counted_data 
WHERE rank_per_year = 1;

-- question 6 - total amount requested -- 
-- creating table counted_data to rank the number of applications made in descending order and pulling then as a new table top_companies as a 
--- new sub-query to find the company uuid with the most apps in years 2016-2020

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
) 

-- Joining two tables the new one top_companies with the original new_starter_training_table1 on company_uuid, year and count to determine the total amount requested.

SELECT top_companies.company_uuid,
top_companies.year, 
top_companies.count,
SUM(new_starter_training_table1.amount_requested) AS total_amount_requested, 
SUM(new_starter_training_table3.amount_lent) AS total_amount_lent
FROM top_companies 
JOIN new_starter_training_table1
ON top_companies.company_uuid = new_starter_training_table1.company_uuid
AND YEAR (new_starter_training_table1.created_date) = top_companies.year 
LEFT JOIN new_starter_training_table3
ON top_companies.company_uuid = new_starter_training_table3.company_uuid
GROUP BY top_companies.company_uuid, top_companies.year, top_companies.count 
ORDER BY top_companies.year;

-- Question 7 - For the applications from the 5 companies, assign a number to the application by each company in the order of application date (the first app, the second app, the third app, etc.)

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
), 
ranked_applications AS (
SELECT 
company_uuid, 
application_uuid, 
created_date, 
amount_requested,
Row_number() OVER (partition by company_uuid ORDER by created_date)
AS app_num
FROM new_starter_training_table1 
)
SELECT 
top_companies.company_uuid, 
top_companies.year,
top_companies.count,
SUM(ranked_applications.amount_requested) AS total_amount_requested,
SUM(new_starter_training_table3.amount_lent) AS total_amount_lent,
ranked_applications.application_uuid
FROM top_companies
JOIN ranked_applications
ON top_companies.company_uuid = ranked_applications.company_uuid
AND YEAR(ranked_applications.created_date) = top_companies.year 
JOIN new_starter_training_table3 
ON top_companies.company_uuid = new_starter_training_table3.company_uuid
GROUP BY top_companies.company_uuid, top_companies.year, top_companies.count, ranked_applications.application_uuid
ORDER BY top_companies.year, ranked_applications.application_uuid;

-- Question 8 

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
), 
ranked_applications AS (
SELECT 
company_uuid, 
application_uuid, 
created_date, 
amount_requested,
Row_number() OVER (partition by company_uuid ORDER by created_date)
AS app_num
FROM new_starter_training_table1 
)
SELECT 
company_uuid, 
application_uuid, 
created_date, 
amount_requested, 
app_num, 
app_num - 1 AS 
apps_before 
FROM 
ranked_applications
ORDER BY company_uuid, app_num;




-- part two -- counted the number of funded apps prior 

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
), 
recent_app AS (
    SELECT 
    top_companies.company_uuid, 
    top_companies.year, 
    MAX(new_starter_training_table1.created_date) AS 
    most_recent_date 
    FROM top_companies
    JOIN new_starter_training_table1
    ON top_companies.company_uuid = new_starter_training_table1.company_uuid
    AND YEAR(new_starter_training_table1.created_date) = top_companies.year
    GROUP BY top_companies.company_uuid, top_companies.year
), 
funded_prior_apps AS (
    SELECT 
    recent_app.company_uuid, 
    recent_app.year,
    COUNT(new_starter_training_table1.application_uuid) AS 
    total_amount_lent_before
    FROM recent_app
    JOIN new_starter_training_table1 
    ON recent_app.company_uuid = new_starter_training_table1.company_uuid
    AND new_starter_training_table1.created_date < recent_app.most_recent_date
    AND YEAR(new_starter_training_table1.created_date) = recent_app.year 
    LEFT JOIN new_starter_training_table3 
    ON recent_app.company_uuid = new_starter_training_table3.company_uuid
    GROUP BY recent_app.company_uuid, recent_app.year
)
SELECT 
top_companies.company_uuid,
top_companies.year,
funded_prior_apps.total_amount_lent_before
FROM top_companies
JOIN funded_prior_apps 
ON top_companies.company_uuid = funded_prior_apps.company_uuid
AND top_companies.year = funded_prior_apps.year 
ORDER BY top_companies.year;




---- calculated the total amount lent prior

WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
), 
recent_app AS (
    SELECT 
    top_companies.company_uuid, 
    top_companies.year, 
    MAX(new_starter_training_table1.created_date) AS 
    most_recent_date 
    FROM top_companies
    JOIN new_starter_training_table1
    ON top_companies.company_uuid = new_starter_training_table1.company_uuid
    AND YEAR(new_starter_training_table1.created_date) = top_companies.year
    GROUP BY top_companies.company_uuid, top_companies.year
), 
funded_prior_apps AS (
    SELECT 
    recent_app.company_uuid, 
    recent_app.year,
    SUM(new_starter_training_table3.amount_lent) AS 
    total_amount_lent_before
    FROM recent_app
    JOIN new_starter_training_table1
    ON recent_app.company_uuid = new_starter_training_table1.company_uuid
    AND new_starter_training_table1.created_date < recent_app.most_recent_date
    AND YEAR(new_starter_training_table1.created_date) = recent_app.year 
    LEFT JOIN new_starter_training_table3 
    ON recent_app.company_uuid = new_starter_training_table3.company_uuid
    GROUP BY recent_app.company_uuid, recent_app.year
)
SELECT 
top_companies.company_uuid,
top_companies.year,
funded_prior_apps.total_amount_lent_before
FROM top_companies
JOIN funded_prior_apps 
ON top_companies.company_uuid = funded_prior_apps.company_uuid
AND top_companies.year = funded_prior_apps.year 
ORDER BY top_companies.year;


--- gives result 40,390,400.00 lent prior to most recent app 
--- total amount lent from Q5 42409920.00 
--- difference should be on most recent app lent amount which would be 2,019,520.00
--- changing line  "AND new_starter_training_table1.created_date < recent_app.most_recent_date" to "AND new_starter_training_table1.created_date = recent_app.most_recent_date" to get the figure for the most recent app made and how much we lent to check the code, where the difference is correct.


WITH counted_data as (
SELECT company_uuid, 
YEAR(created_date) as year,
COUNT (*) as count,
row_number() over (partition by YEAR(created_date) ORDER BY COUNT(*) DESC) as rank_per_year
FROM "new_starter_training_table1"
WHERE company_uuid != 
'e52f3166-d864-11e2-8dce-58a71294ce6b'
GROUP BY company_uuid, YEAR(created_date)),
top_companies AS 
(SELECT company_uuid, year, count 
FROM counted_data 
WHERE year BETWEEN 2016 AND 2020 AND rank_per_year = 1
), 
recent_app AS (
    SELECT 
    top_companies.company_uuid, 
    top_companies.year, 
    MAX(new_starter_training_table1.created_date) AS 
    most_recent_date 
    FROM top_companies
    JOIN new_starter_training_table1
    ON top_companies.company_uuid = new_starter_training_table1.company_uuid
    AND YEAR(new_starter_training_table1.created_date) = top_companies.year
    GROUP BY top_companies.company_uuid, top_companies.year
), 
funded_prior_apps AS (
    SELECT 
    recent_app.company_uuid, 
    recent_app.year,
    SUM(new_starter_training_table3.amount_lent) AS 
    total_amount_lent_before
    FROM recent_app
    JOIN new_starter_training_table1
    ON recent_app.company_uuid = new_starter_training_table1.company_uuid
    AND new_starter_training_table1.created_date = recent_app.most_recent_date
    AND YEAR(new_starter_training_table1.created_date) = recent_app.year 
    LEFT JOIN new_starter_training_table3 
    ON recent_app.company_uuid = new_starter_training_table3.company_uuid
    GROUP BY recent_app.company_uuid, recent_app.year
)
SELECT 
top_companies.company_uuid,
top_companies.year,
funded_prior_apps.total_amount_lent_before
FROM top_companies
JOIN funded_prior_apps 
ON top_companies.company_uuid = funded_prior_apps.company_uuid
AND top_companies.year = funded_prior_apps.year 
ORDER BY top_companies.year;

-- Question 9: At the time of a given company’s application, how old is the previous loan of that company?

WITH filtered_data AS (
    SELECT
        nst1.created_date AS ca_date,
        nst1.application_uuid AS application,
        max(nst3.loan_start_date) as most_recent_loan
    FROM
        new_starter_training_table1 nst1
    JOIN
        new_starter_training_table3 nst3
    ON
        nst1.company_uuid = nst3.company_uuid
        AND nst1.created_date > nst3.loan_start_date
        GROUP BY 1, 2
)
    SELECT
    ca_date,
    application,
    most_recent_loan,
    DATE_DIFF('day', most_recent_loan, ca_date) AS days_since_last_loan
FROM filtered_data;

-- For all the applications from the 5 companies which are funded, what is the status and principal remaining of the loans as of today?