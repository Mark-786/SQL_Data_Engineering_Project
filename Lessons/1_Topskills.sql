/*
SELECT sd.skills, COUNT(jpf.job_id) AS total_count
FROM skills_dim AS sd 
LEFT JOIN skills_job_dim AS sjd 
ON sd.skill_id = sjd.skill_id
LEFT JOIN job_postings_fact AS jpf
ON sjd.job_id = jpf.job_id
WHERE job_title_short = 'Data Engineer' AND  job_location LIKE '%UK%' 
GROUP BY sd.skills
ORDER BY total_count DESC
limit 10;
*/
