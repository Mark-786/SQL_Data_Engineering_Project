Problem Statement
Identify the most frequently required skills for job postings in the data_jobs database that offer a yearly salary greater than $100,000.


Write a query that combines job_postings_fact with skills_job_dim and skills_dim to associate high-paying jobs with their specific skills
Select, in order:
job_title_short
skills
a count of job postings (aliased as job_count)
Filter the results so that the yearly salary (salary_year_avg) is greater than 100000
Group the results by job_title_short and skills so the count summarizes each unique skill combination
Order the final result set by the job_count from highest to lowest

select jpf.job_title_short, sd.skills, COUNT(jpf.job_id) AS job_count 
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id 
INNER JOIN skills_dim as sd 
on sjd.skill_id = sd.skill_id 
where jpf.salary_year_avg > 100000
group by jpf.job_title_short, sd.skills
ORDER BY job_count DESC;

select * from job_postings_fact where 

SELECT sd.skills, COUNT(sjd.job_id) AS Total_count
FROM skills_dim AS sd 
LEFT JOIN skills_job_dim AS sjd 
ON sd.skill_id = sjd.skill_id 
LEFT JOIN job_postings_fact AS jpf 
ON sjd.job_id = jpf.job_id
WHERE job_title_short = 'Data Engineer' AND job_work_from_home = TRUE
GROUP BY sd.skills
LIMIT 10;


SELECT sd.skills, jpf.salary_year_avg AS Total_salary
FROM skills_dim AS sd 
LEFT JOIN skills_job_dim AS sjd 
ON sd.skill_id = sjd.skill_id 
LEFT JOIN job_postings_fact AS jpf 
ON sjd.job_id = jpf.job_id
WHERE job_title_short = 'Data Engineer'
GROUP BY sd.skills, jpf.salary_year_avg
ORDER BY Total_salary DESC
LIMIT 10;