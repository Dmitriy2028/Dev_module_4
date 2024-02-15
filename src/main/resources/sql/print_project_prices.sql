WITH project_prices AS (
    SELECT p.ID AS project_id,
           p.START_DATE,
           p.FINISH_DATE,
           SUM(w.salary) * EXTRACT(month FROM (age(p.finish_date, p.start_date))) AS project_price
    FROM project p
    JOIN project_worker pw ON p.ID = pw.PROJECT_ID
    JOIN worker w ON pw.WORKER_ID = w.ID
    GROUP BY p.ID, p.START_DATE, p.FINISH_DATE
)
SELECT p.ID AS project_id,
       pp.project_price AS project_cost
FROM project p
JOIN project_prices pp ON p.ID = pp.project_id
ORDER BY pp.project_price DESC;