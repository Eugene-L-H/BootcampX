--  average_assistance_request_duration 
-- -------------------------------------
--  00:14:21.556903
-- (1 row)

SELECT AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_request_duration
FROM assistance_requests;