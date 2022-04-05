SELECT day* as day,  count(name) as total_assignments
FROM assignments
ORDER BY day;
