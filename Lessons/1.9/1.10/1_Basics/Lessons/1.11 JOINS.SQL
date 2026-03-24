Duckdb md:data_jobs

SELECT jpf.job_id,
   jpf.job_title_short,
   cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
ON jpf.company_id = cd.company_id
LIMIT 7;    






SELECT jpf.job_id, jpf.job_title,jpf.job_posted_date, 
jpf.job_location,
 cd.name AS name 
 FROM job_postings_fact AS jpf
  LEFT JOIN company_dim AS cd 
ON jpf.company_id = 
cd.company_id;




select * from company_dim;