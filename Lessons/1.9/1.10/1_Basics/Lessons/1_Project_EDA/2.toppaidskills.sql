SELECT sd.skills, ROUND(MEDIAN(jpf.salary_year_avg)) AS Total_salary, COUNT(jpf.*) AS total_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
ON jpf.job_id = sjd.job_id 
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer' AND jpf.job_work_from_home = True
GROUP BY sd.skills
having COUNT(jpf.*) > 100
ORDER BY total_salary DESC
LIMIT 25;




















