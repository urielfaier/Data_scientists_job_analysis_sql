/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- only look at skills with enough sample data of above 50 job posting with that skill 
- Focuses on roles with specified salaries, 
- Why? It reveals how different skills impact salary levels for Data Scientist and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
HAVING COUNT(*) > 50
ORDER BY
    avg_salary DESC
LIMIT 10;

/*
Here's a breakdown of the results for top paying skills for Data Scientist:
- High Demand for Big Data & ML Skills: Top salaries are commanded by Scientist skilled in big data technologies (Spark, bigquery, Snowflake), machine learning tools (pytorch, tensorflow).
- Software Development & Data Management and Workflow Proficiency: Knowledge in development and deployment tools (Airflow, Go, Express) indicates a lucrative crossover between data Scientist and greater technical skills.

[
 [
  {
    "skills": "airflow",
    "avg_salary": "155878"
  },
  {
    "skills": "bigquery",
    "avg_salary": "149292"
  },
  {
    "skills": "express",
    "avg_salary": "148333"
  },
  {
    "skills": "looker",
    "avg_salary": "147538"
  },
  {
    "skills": "go",
    "avg_salary": "147466"
  },
  {
    "skills": "pytorch",
    "avg_salary": "145989"
  },
  {
    "skills": "scala",
    "avg_salary": "145056"
  },
  {
    "skills": "spark",
    "avg_salary": "144399"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "143440"
  },
  {
    "skills": "snowflake",
    "avg_salary": "142691"
  }
]
*/