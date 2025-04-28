# 📊 Data Analyst Job Market - SQL Project

## Introduction

Welcome to my SQL project exploring the data analyst job market!  
In this project, I dive into 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary — all focused on remote data analyst roles.

This project was inspired by my passion for learning data analytics and my goal to sharpen my real-world SQL and data exploration skills.  
Special thanks to **Luke Barousse** on YouTube for the learning inspiration!

## Background

I created this project to better understand the skills and opportunities in the data analyst market.  
The project answers important questions:

- 🏆 What are the top-paying data analyst jobs?
- 🧠 What skills are required for these top-paying jobs?
- 📈 What skills are most in demand for data analysts?
- 💸 Which skills are associated with higher salaries?
- 🎯 What are the most optimal skills to learn?

The data was sourced from my SQL learning course, containing job titles, salaries, remote work information, companies, and skills.

## Tools Used

- **SQL**: Querying and data exploration
- **PostgreSQL**: Database management system
- **Visual Studio Code**: Writing and running SQL queries
- **Git & GitHub**: Version control and project sharing
- **Luke Barousse's YouTube tutorials**: Learning resource for SQL techniques

## The Analysis

Each SQL query was crafted to answer a specific question about the data analyst job market:

---

### 1️⃣ Top Paying Data Analyst Jobs

```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

**Findings**:

- Salaries ranged up to $650,000 for remote data analyst jobs!

- Companies like Meta, AT&T, and SmartAsset featured at the top.

- Significant variety in job titles and specialization levels.
---
### 2️⃣ Skills for Top Paying Jobs

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
**Findings**:

- Top skills included SQL, Python, and Tableau.

- Most high-paying roles demanded a mix of programming and visualization tools.
---
### 3️⃣ In-Demand Skills for Data Analysts

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
**Findings**:

- Most requested skills: SQL, Excel, Python, Tableau, and Power BI.

- Foundational skills like SQL and Excel remain essential.

---
### 4️⃣ Skills Based on Salary

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
**Findings**:

- Highest-paying skills included PySpark, GitLab, Couchbase, and DataRobot.

- Specialized tools in big data, machine learning, and cloud engineering offer salary boosts.
---
### 5️⃣ Most Optimal Skills to Learn

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
**Findings**:

- Snowflake, AWS, Azure, and BigQuery skills were highly optimal.

- These skills combined high demand and high salary potential.

## 📚 What I Learned

Throughout this project, I gained valuable hands-on experience:

- 🚀 **Advanced SQL Queries**: Including CTEs (`WITH` clauses), JOINs, aggregation, and filtering techniques.
- 📊 **Real-World Data Analysis**: Asking critical questions and translating them into SQL code.
- 🔥 **Market Insight**: Understanding how specific technical skills influence salary and hiring demand.
- 🛠 **Problem-Solving**: Handling missing data, filtering complex datasets, and finding optimal analytical approaches.

This project also motivated me to dive deeper into the **Data Science** world, especially into machine learning, cloud platforms, and advanced data engineering tools.



## 📝 Conclusions

- ✅ Top-paying data analyst jobs can reach up to **$650,000** for remote roles.
- ✅ **SQL** remains the top skill for both salary and demand.
- ✅ Specialized **cloud**, **big data**, and **machine learning** skills boost earning potential.
- ✅ Focusing on optimal skills like **Snowflake**, **AWS**, and **BigQuery** can maximize market value.



## 🚀 What's Next?

I'm excited to continue growing in the **Data Science** field! Here are my next steps:

- 🐍 Learn **Python** for Data Analysis and Machine Learning (Pandas, Scikit-Learn)
- ☁️ Explore **Cloud technologies** (AWS, GCP, Azure)
- 🛠 Study **Data Engineering** (ETL pipelines, Big Data frameworks)
- 📈 Improve **SQL optimization** and **data visualization** skills through more projects



## 🙌 Credits

Huge thanks to **Luke Barousse** (YouTube) for providing amazing SQL learning content that inspired this project!

