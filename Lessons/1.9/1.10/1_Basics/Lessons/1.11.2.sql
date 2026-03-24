Write a query that connects job_postings_fact to skills_job_dim and skills_dim to associate each job with its skills
Select, in order:
job_id (from job_postings_fact)
job_title (from job_postings_fact)
skills (from skills_dim)
job_country (from job_postings_fact)
Filter the results for:
Data Engineer jobs (use job_title_short)
Country of United States
Include health insurance benefits
Order the final result set from highest to lowest based on job_id

select * from skills_job_dim limit 4;
select * from job_postings_fact limit 3;


SELECT jpf.job_id, jpf.job_title_short, s.skills, jpf.job_country, jpf.job_health_insurance
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd 
ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS s
ON sjd.skill_id = s.skill_id
WHERE jpf.job_title_short = 'Data Engineer' AND jpf.job_country = 'United States' AND jpf.job_health_insurance = TRUE 
GROUP BY jpf.job_id, jpf.job_title_short, s.skills, jpf.job_country, jpf.job_health_insurance
ORDER BY jpf.job_id DESC
LIMIT 10;