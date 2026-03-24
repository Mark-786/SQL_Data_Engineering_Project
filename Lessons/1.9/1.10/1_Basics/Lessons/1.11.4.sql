Determine the frequency of each skill mentioned across all job postings where the job title contains the 
word "Data" in the data_jobs database.

Write a query that connects job_postings_fact to skills_job_dim and then to skills_dim to associate job postings with their skills
Select, in order
job_title_short
skill_id
skills
a count of job postings (aliased as job_count)
Filter the results so that the job_title_short contains the word 'Data'
Group the results by the short job title, skill ID, and skill name so the count summarizes each unique skill combination
Order the final result set by the job count from highest to lowest

SELECT jpf.job_title_short, sjd.skill_id, sd.skills, COUNT(jpf.job_id) AS Job_count
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd 
ON jpf.job_id = sjd.job_id
LEFT join skills_dim AS sd 
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short LIKE '%Data%'
GROUP BY jpf.job_title_short, sjd.skill_id, sd.skills 
ORDER BY job_count DESC;


