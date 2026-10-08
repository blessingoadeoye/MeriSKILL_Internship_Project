/*
============================================================
MERISKILL INTERNSHIP PROJECT — HR ATTRITION ANALYSIS
============================================================

This analysis explores employee attrition across employee
demographics, job characteristics, engagement measures,
and organizational factors.

The analysis focuses on:
1. Overall employee attrition
2. Employee demographics
3. Job characteristics
4. Employee engagement
5. Organizational factors

Metric note:
The overall attrition rate compares employees who left with
the total employee population.

The subgroup analyses below examine how the recorded
attrition cases were distributed across different employee
categories. These values represent attrition counts rather
than subgroup-specific attrition rates.
============================================================
*/


/* ============================================================
   Q1. EMPLOYEE ATTRITION OVERVIEW
   ============================================================
   
-- Establish the size of the workforce and the overall level
   of employee attrition.
*/

SELECT
    COUNT(EmployeeCount) AS total_employees
FROM hr_analysis;


SELECT
    CASE
        WHEN Attrition = 'yes' THEN 'Attrition'
        WHEN Attrition = 'no' THEN 'No Attrition'
    END AS employee_status,
    COUNT(EmployeeCount) AS employee_count
FROM hr_analysis
GROUP BY Attrition;

/*
   FINDING:
   The dataset contained 1,470 employees. Of these, 237
   employees left while 1,233 remained, representing an
   overall attrition rate of approximately 16.12%.
*/


/* ============================================================
   Q2. ATTRITION BY GENDER
   ============================================================

-- Review how the recorded attrition cases were distributed
   between male and female employees.
*/

SELECT
    Gender AS gender_segment,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Gender;

/*
   FINDING:
   Male employees accounted for more of the recorded
   attrition cases than female employees.
*/


/* ============================================================
   Q3. ATTRITION BY MARITAL STATUS AND GENDER
   ============================================================

-- Examine the distribution of attrition cases across
   marital status and gender.
*/

SELECT
    MaritalStatus AS marital_status,
    Gender,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY MaritalStatus, Gender
ORDER BY attrition_count DESC;

/*
   FINDING:
   Single employees accounted for a notable share of the
   recorded attrition cases, particularly among male
   employees.
*/


/* ============================================================
   Q4. ATTRITION BY AGE GROUP
   ============================================================

-- Group employees who left into broader age categories to
   examine where attrition cases were concentrated.
*/

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    END AS age_category,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY age_category
ORDER BY age_category;

/*
   FINDING:
   Most recorded attrition cases were concentrated among
   employees aged 18-45, while fewer cases occurred among
   employees aged 46-60.
*/


/* ============================================================
   Q5. ATTRITION BY EDUCATION FIELD
   ============================================================
  
-- Examine how attrition cases were distributed across
   employees' education fields.
*/

SELECT
    EducationField AS education_field,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY EducationField
ORDER BY attrition_count DESC;

/*
   FINDING:
   Life Sciences accounted for the largest number of
   recorded attrition cases, followed by Medical.
*/


/* ============================================================
   Q6. ATTRITION BY DEPARTMENT
   ============================================================

-- Compare recorded attrition cases across departments.
*/

SELECT
    Department,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Department
ORDER BY attrition_count DESC;

/*
   FINDING:
   Research & Development accounted for the largest number
   of recorded attrition cases, followed by Sales.
*/


/* ============================================================
   Q7. ATTRITION BY JOB ROLE
   ============================================================
   
-- Identify the job roles that accounted for the largest
   number of recorded attrition cases.
*/

SELECT
    JobRole AS job_role,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;

/*
   FINDING:
   Laboratory Technicians recorded the largest number of
   attrition cases, followed by Sales Executives and
   Research Scientists.
*/


/* ============================================================
   Q8. ATTRITION BY JOB LEVEL
   ============================================================
 
-- Examine the distribution of attrition cases across
   different job levels.
*/

SELECT
    CASE
        WHEN JobLevel = 1 THEN 'Entry Level'
        WHEN JobLevel = 2 THEN 'Junior or Associate'
        WHEN JobLevel = 3 THEN 'Mid Level Specialist'
        WHEN JobLevel = 4 THEN 'Senior'
        WHEN JobLevel = 5 THEN 'Executive'
    END AS job_level,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY job_level
ORDER BY attrition_count DESC;

/*
   FINDING:
   Entry-level employees accounted for the largest number
   of recorded attrition cases.
*/


/* ============================================================
   Q9. ATTRITION BY YEARS IN CURRENT ROLE
   ============================================================
 
-- Examine attrition cases by years spent in the current
   role and department.
*/

SELECT
    YearsInCurrentRole AS years_in_current_role,
    Department,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY YearsInCurrentRole, Department
ORDER BY YearsInCurrentRole, Department;

/*
   FINDING:
   Attrition cases were more concentrated among employees
   with fewer years in their current roles, particularly
   within Research & Development and Sales.
*/


/* ============================================================
   Q10. ATTRITION BY PERFORMANCE RATING
   ============================================================

-- Compare recorded attrition cases across employee
   performance ratings.
*/

SELECT
    CASE
        WHEN PerformanceRating = 3 THEN 'Low'
        WHEN PerformanceRating = 4 THEN 'High'
    END AS performance_rating,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY performance_rating;

/*
   FINDING:
   Most recorded attrition cases occurred among employees
   in the lower of the two performance-rating categories
   represented in the analysis.
*/


/* ============================================================
   Q11. ATTRITION BY WORK-LIFE BALANCE
   ============================================================
  
-- Examine how attrition cases were distributed across
   work-life balance ratings.
*/

SELECT
    CASE
        WHEN WorkLifeBalance = 1 THEN 'Bad'
        WHEN WorkLifeBalance = 2 THEN 'Average'
        WHEN WorkLifeBalance = 3 THEN 'Good'
        WHEN WorkLifeBalance = 4 THEN 'Excellent'
    END AS work_life_balance,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY work_life_balance
ORDER BY attrition_count DESC;

/*
   FINDING:
   Employees rated as having good work-life balance
   accounted for the largest number of recorded attrition
   cases.
*/


/* ============================================================
   Q12. ATTRITION BY OVERTIME
   ============================================================
  
-- Compare recorded attrition cases between employees who
   worked overtime and those who did not.
*/

SELECT
    Overtime,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Overtime;

/*
   FINDING:
   Employees who worked overtime accounted for slightly
   more of the recorded attrition cases than employees who
   did not.
*/


/* ============================================================
   Q13. ATTRITION BY JOB INVOLVEMENT
   ============================================================
   
-- Examine the distribution of attrition cases across job
   involvement levels.
*/

SELECT
    CASE
        WHEN JobInvolvement = 1 THEN 'Very Low'
        WHEN JobInvolvement = 2 THEN 'Low'
        WHEN JobInvolvement = 3 THEN 'Moderate'
        WHEN JobInvolvement = 4 THEN 'High'
    END AS job_involvement,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY job_involvement
ORDER BY attrition_count DESC;

/*
   FINDING:
   Employees with moderate job involvement accounted for
   the largest number of recorded attrition cases.
*/


/* ============================================================
   Q14. ATTRITION BY DISTANCE FROM HOME
   ============================================================
  
-- Group employees by distance from home to examine how
   recorded attrition cases were distributed.
*/

SELECT
    CASE
        WHEN DistanceFromHome BETWEEN 1 AND 10 THEN 'Near'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN 'Far'
        WHEN DistanceFromHome BETWEEN 21 AND 30 THEN 'Very Far'
    END AS distance_from_home,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY distance_from_home
ORDER BY attrition_count DESC;

/*
   FINDING:
   Employees living nearer to work accounted for the
   largest number of recorded attrition cases.
*/


/* ============================================================
   Q15. ATTRITION BY JOB SATISFACTION
   ============================================================

-- Examine how recorded attrition cases were distributed
   across job satisfaction levels.
*/

SELECT
    CASE
        WHEN JobSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN JobSatisfaction = 2 THEN 'Dissatisfied'
        WHEN JobSatisfaction = 3 THEN 'Satisfied'
        WHEN JobSatisfaction = 4 THEN 'Very Satisfied'
    END AS job_satisfaction,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY job_satisfaction
ORDER BY attrition_count DESC;

/*
   FINDING:
   Recorded attrition cases occurred across all job
   satisfaction levels, with the largest number among
   employees classified as satisfied.
*/


/* ============================================================
   Q16. ATTRITION BY ENVIRONMENT SATISFACTION
   ============================================================
  
-- Examine how recorded attrition cases were distributed
   across environment satisfaction levels.
*/

SELECT
    CASE
        WHEN EnvironmentSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN EnvironmentSatisfaction = 2 THEN 'Dissatisfied'
        WHEN EnvironmentSatisfaction = 3 THEN 'Satisfied'
        WHEN EnvironmentSatisfaction = 4 THEN 'Very Satisfied'
    END AS environment_satisfaction,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY environment_satisfaction
ORDER BY attrition_count DESC;

/*
   FINDING:
   The largest number of recorded attrition cases occurred
   among employees classified as very dissatisfied with
   their work environment.
*/


/* ============================================================
   Q17. ATTRITION BY RELATIONSHIP SATISFACTION
   ============================================================
  
-- Examine how recorded attrition cases were distributed
   across relationship satisfaction levels.
*/

SELECT
    CASE
        WHEN RelationshipSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN RelationshipSatisfaction = 2 THEN 'Dissatisfied'
        WHEN RelationshipSatisfaction = 3 THEN 'Satisfied'
        WHEN RelationshipSatisfaction = 4 THEN 'Very Satisfied'
    END AS relationship_satisfaction,
    COUNT(Attrition) AS attrition_count
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY relationship_satisfaction
ORDER BY attrition_count DESC;

/*
   FINDING:
   Relationship satisfaction showed attrition cases across
   all four categories, with the largest number among
   employees classified as satisfied.
*/


/*
============================================================
OVERALL FINDING
============================================================

The HR analysis recorded an overall employee attrition rate
of approximately 16.12%. Among the employees who left,
attrition cases were concentrated in several demographic,
job, engagement, and organizational categories, including
younger and middle-aged employees, entry-level roles,
Research & Development, and selected job roles.
*/
