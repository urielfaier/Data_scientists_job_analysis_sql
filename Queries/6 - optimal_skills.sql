/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in Data Science.
*/

-- Identifies skills in high demand for Data Scientist roles
-- Use Query #4
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist' 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles

-- Use Query #5
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Scientist'
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 

SELECT
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
  demand_count DESC,
    avg_salary DESC
    
LIMIT 25;
/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
High-Demand Programming Languages: Python, SQL and R stand out for their high demand, with demand counts of 4312, 3151 and 2486 respectively. 
Cloud Tools and Technologies: Skills in specialized technologies such as AWS, Azure show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data science.
Machine Learning Skills: TensorFlow, PyTorch, Scikit-learn highlights the demand for machine learning skills.
Business Intelligence and Visualization Tools: Tableau and power bi, with demand counts of 1278 and 489 respectively.
Database Technologies: Tools like SQL, Spark, Hadoop, Snowflake, Databricks reflects the enduring need for data storage, retrieval, and management expertise.

[
  {
    "skills": "python",
    "demand_count": "4312",
    "avg_salary": "138049"
  },
  {
    "skills": "sql",
    "demand_count": "3151",
    "avg_salary": "138430"
  },
  {
    "skills": "r",
    "demand_count": "2486",
    "avg_salary": "135165"
  },
  {
    "skills": "tableau",
    "demand_count": "1278",
    "avg_salary": "131636"
  },
  {
    "skills": "aws",
    "demand_count": "1016",
    "avg_salary": "138861"
  },
  {
    "skills": "spark",
    "demand_count": "946",
    "avg_salary": "144399"
  },
  {
    "skills": "tensorflow",
    "demand_count": "641",
    "avg_salary": "143440"
  },
  {
    "skills": "azure",
    "demand_count": "623",
    "avg_salary": "132897"
  },
  {
    "skills": "excel",
    "demand_count": "617",
    "avg_salary": "124593"
  },
  {
    "skills": "sas",
    "demand_count": "615",
    "avg_salary": "122910"
  },
  {
    "skills": "sas",
    "demand_count": "615",
    "avg_salary": "122910"
  },
  {
    "skills": "hadoop",
    "demand_count": "602",
    "avg_salary": "136429"
  },
  {
    "skills": "pytorch",
    "demand_count": "564",
    "avg_salary": "145989"
  },
  {
    "skills": "java",
    "demand_count": "557",
    "avg_salary": "130701"
  },
  {
    "skills": "power bi",
    "demand_count": "489",
    "avg_salary": "118603"
  },
  {
    "skills": "pandas",
    "demand_count": "481",
    "avg_salary": "138269"
  },
  {
    "skills": "scikit-learn",
    "demand_count": "392",
    "avg_salary": "141777"
  },
  {
    "skills": "scala",
    "demand_count": "381",
    "avg_salary": "145056"
  },
  {
    "skills": "git",
    "demand_count": "376",
    "avg_salary": "123277"
  },
  {
    "skills": "numpy",
    "demand_count": "339",
    "avg_salary": "136720"
  },
  {
    "skills": "go",
    "demand_count": "316",
    "avg_salary": "147466"
  },
  {
    "skills": "databricks",
    "demand_count": "314",
    "avg_salary": "135491"
  },
  {
    "skills": "snowflake",
    "demand_count": "313",
    "avg_salary": "142691"
  },
  {
    "skills": "c++",
    "demand_count": "290",
    "avg_salary": "134698"
  },
  {
    "skills": "c",
    "demand_count": "280",
    "avg_salary": "142278"
  }
]
*/