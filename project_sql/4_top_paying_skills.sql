SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/* High Level Skills, High Pay
   - Big Data & ML Skills
        Big Data Tech (PySpark, Couchbase)
        ML Tools (DataRobot, Jupyter)
        Python Libraries (Pandas, NumPy)

    - Software Dev
        Gitlab, Kubernetes, Airflow
*/