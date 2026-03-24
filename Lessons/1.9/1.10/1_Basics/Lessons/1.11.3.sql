Explore the relationship between job postings and skill mappings for roles in the United States 
by combining all records from both the job postings table and the skills bridge table, regardless of whether they have a match.

Create a SQL file in the Lesson folder (e.g., 1.11.3.sql)
Write a query that combines job_postings_fact and skills_job_dim to show all records from both tables
Select, in order
job_id
job_title_short
job_title
job_location
skill_id
Filter the results to only include rows where the country is United States
Order the final result set by job_id and then skill_id

SELECT jpf.job_id, jpf.job_title_short, jpf.job_title, jpf.job_location, sjd.skill_id
FROM job_postings_fact AS jpf
FULL JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id
WHERE jpf.job_country = 'United States'
ORDER BY jpf.job_id AND sjd.skill_id DESC;