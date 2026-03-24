Write a query against the information_schema.key_column_usage table

SELECT * FROM information_schema_table;


SELECT table_name, constraint_name, COUNT(constraint_name) as constraint_name_count FROM information_schema.key_column_usage
GROUP BY table_name, constraint_name
having COUNT(constraint_name) > 1;