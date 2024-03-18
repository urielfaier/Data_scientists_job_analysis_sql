/*
Question: What are the most in-demand skills for  Data Scientist?
- Join job postings to inner join table similar to last query 
- Identify the top 5 in-demand skills for a Data Scientist.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'  
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
In 2023, the most demanded skills for Data Scientists include:

1. Python and SQL: Fundamental for data processing and database manipulation.
2. Programming and Visualization Tools (e.g., R, Tableau): Essential for data storytelling and decision support.
3. SAS (Statistical Analysis System): Crucial for statistical analysis, data management, and programming.

[
  {
    "skills": "python",
    "demand_count": "114016"
  },
  {
    "skills": "sql",
    "demand_count": "79174"
  },
  {
    "skills": "r",
    "demand_count": "59754"
  },
  {
    "skills": "sas",
    "demand_count": "29642"
  },
  {
    "skills": "tableau",
    "demand_count": "29513"
  }
]
*/