-- question 1.1: Total number of patient admissions
SELECT COUNT(*) AS total_admissions FROM admissions;

-- question 1.2: average length of stay for all patients
select AVG(admission_date) AS avg_length_of_stay
from admissions;

-- part 2: grouping data

-- question 2.1: total number of admissions grouped by primary diagnosis
select primary_diagnosis, count(*) as total_admissions
from admissions
group by primary_diagnosis;

-- question 2.2: average length of stay grouped by service
select service, avg( admission_date) as avg_length_of_stay
from admissions
group by service;

-- question 2.3: Count of discharges grouped by discharge disposition
SELECT discharge_disposition, COUNT(*) AS total_discharges 
FROM discharges 
GROUP BY discharge_disposition;

-- Part 3: Combining Aggregates and Filtering

-- question 3.1: Services with total admissions greater than 5
SELECT service, COUNT(*) AS total_admissions 
FROM admissions 
GROUP BY service 
HAVING COUNT(*) > 5;

-- question 3.2: Average length of stay for patients admitted with a primary diagnosis of "Stroke"
SELECT AVG( admission_date) AS avg_length_of_stay 
FROM admissions 
WHERE primary_diagnosis = 'Stroke';

-- Part 4: Advanced Grouping and Summarizing

-- question 4.1: Total number of emergency department visits by acuity level
SELECT acuity, COUNT(*) AS total_visits 
FROM ed_visits 
GROUP BY acuity;

-- question 4.2: Total admissions grouped by primary diagnosis and service
SELECT primary_diagnosis, service, COUNT(*) AS total_admissions 
FROM admissions 
GROUP BY primary_diagnosis, service;

-- Part 5: Practical Financial Analysis

-- question 5.1: Total number of admissions per month
SELECT DATE_FORMAT(admission_date, '%Y-%m') AS admission_month, COUNT(*) AS total_admissions 
FROM admissions 
GROUP BY admission_month;

-- question 5.2: Maximum length of stay for each primary diagnosis
SELECT primary_diagnosis, MAX( admission_date) AS max_length_of_stay 
FROM admissions 
GROUP BY primary_diagnosis;
