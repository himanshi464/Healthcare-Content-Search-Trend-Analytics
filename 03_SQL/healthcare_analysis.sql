-- Healthcare Content & Search Trend Analytics
-- Tables expected: search_trends, content_performance, doctors

-- 1. Total posts
SELECT COUNT(*) AS total_posts FROM content_performance;

-- 2. Total reach
SELECT SUM(reach) AS total_reach FROM content_performance;

-- 3. Average engagement rate
SELECT AVG(engagement_rate) AS avg_engagement_rate FROM content_performance;

-- 4. Topic performance
SELECT topic, COUNT(*) AS posts, AVG(engagement_rate) AS avg_engagement
FROM content_performance
GROUP BY topic
ORDER BY avg_engagement DESC;

-- 5. Content-type performance
SELECT content_type, COUNT(*) AS posts, AVG(engagement_rate) AS avg_engagement,
       SUM(reach) AS total_reach
FROM content_performance
GROUP BY content_type
ORDER BY avg_engagement DESC;

-- 6. Specialty performance
SELECT specialty, COUNT(*) AS posts, AVG(engagement_rate) AS avg_engagement,
       SUM(reach) AS total_reach
FROM content_performance
GROUP BY specialty
ORDER BY avg_engagement DESC;

-- 7. JOIN doctors to content
SELECT c.post_id, c.topic, c.content_type, c.reach, c.engagement_rate,
       d.specialty, d.city
FROM content_performance c
JOIN doctors d ON c.doctor_id = d.doctor_id;

-- 8. HAVING
SELECT topic, AVG(engagement_rate) AS avg_engagement
FROM content_performance
GROUP BY topic
HAVING AVG(engagement_rate) > 5
ORDER BY avg_engagement DESC;

-- 9. CASE WHEN
SELECT post_id, engagement_rate,
       CASE
         WHEN engagement_rate >= 8 THEN 'High'
         WHEN engagement_rate >= 4 THEN 'Medium'
         ELSE 'Low'
       END AS engagement_category
FROM content_performance;

-- 10. CTE
WITH topic_performance AS (
    SELECT topic, AVG(engagement_rate) AS avg_engagement
    FROM content_performance
    GROUP BY topic
)
SELECT * FROM topic_performance
WHERE avg_engagement > 5;

-- 11. Window function
SELECT specialty, topic, AVG(engagement_rate) AS avg_engagement,
       RANK() OVER (PARTITION BY specialty ORDER BY AVG(engagement_rate) DESC) AS topic_rank
FROM content_performance
GROUP BY specialty, topic;
