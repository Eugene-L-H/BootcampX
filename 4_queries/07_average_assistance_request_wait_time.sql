--  average_wait_time 
-- -------------------
--  00:08:46.258793
-- (1 row)

SELECT AVG(assistance_requests.started_at - assistance_requests.created_at) AS average_wait_time
FROM assistance_requests;