#!/usr/bin/env bash
docker compose exec postgres psql -U n8n -d n8n -c "
SELECT route,
       count(*)                   AS leads,
       round(avg(icp_score),1)    AS avg_score,
       round(avg(processing_ms))  AS avg_ms
FROM app.leads GROUP BY route ORDER BY leads DESC;"
