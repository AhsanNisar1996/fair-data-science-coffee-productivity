-- =====================================================
-- FAIR Data Science Coffee Productivity Project
-- WP2 - T2.1 Database Schema (3NF)
-- WP2 - T2.4 Machine Learning Feature Views
--
-- Views defined:
--   vw_productivity_features     -- full feature table for ML pipeline
--   vw_coffee_health_aggregates  -- per-group health aggregates for EDA
-- =====================================================

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE genders (
    gender_id SERIAL PRIMARY KEY,
    gender_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE occupations (
    occupation_id SERIAL PRIMARY KEY,
    occupation_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE participants (
    participant_id INTEGER PRIMARY KEY,
    age INTEGER NOT NULL,
    gender_id INTEGER REFERENCES genders(gender_id),
    country_id INTEGER REFERENCES countries(country_id),
    occupation_id INTEGER REFERENCES occupations(occupation_id)
);

CREATE TABLE coffee_consumption (
    consumption_id SERIAL PRIMARY KEY,
    participant_id INTEGER REFERENCES participants(participant_id),
    coffee_intake_cups_per_day DECIMAL(4,2),
    caffeine_mg_per_day DECIMAL(6,2)
);

CREATE TABLE sleep_metrics (
    sleep_id SERIAL PRIMARY KEY,
    participant_id INTEGER REFERENCES participants(participant_id),
    sleep_hours DECIMAL(4,2),
    sleep_quality VARCHAR(50)
);

CREATE TABLE health_metrics (
    health_id SERIAL PRIMARY KEY,
    participant_id INTEGER REFERENCES participants(participant_id),
    bmi DECIMAL(5,2),
    heart_rate_bpm INTEGER,
    health_issues TEXT
);

CREATE TABLE lifestyle_metrics (
    lifestyle_id SERIAL PRIMARY KEY,
    participant_id INTEGER REFERENCES participants(participant_id),
    stress_level VARCHAR(50),
    physical_activity_hours DECIMAL(5,2),
    smoking BOOLEAN,
    alcohol_consumption BOOLEAN
);

-- =====================================================
-- Machine Learning Feature View
-- =====================================================

CREATE VIEW vw_productivity_features AS
SELECT
    p.participant_id,
    p.age,
    g.gender_name,
    c.country_name,
    o.occupation_name,
    cc.coffee_intake_cups_per_day,
    cc.caffeine_mg_per_day,
    sm.sleep_hours,
    sm.sleep_quality,
    hm.bmi,
    hm.heart_rate_bpm,
    hm.health_issues,
    lm.stress_level,
    lm.physical_activity_hours,
    lm.smoking,
    lm.alcohol_consumption,
    CASE
        WHEN sm.sleep_hours BETWEEN 7 AND 9
         AND sm.sleep_quality IN ('Good', 'Excellent')
         AND lm.stress_level IN ('Low', 'Medium')
        THEN 1
        ELSE 0
    END AS productivity_label
FROM participants p
JOIN genders g ON p.gender_id = g.gender_id
JOIN countries c ON p.country_id = c.country_id
JOIN occupations o ON p.occupation_id = o.occupation_id
JOIN coffee_consumption cc ON p.participant_id = cc.participant_id
JOIN sleep_metrics sm ON p.participant_id = sm.participant_id
JOIN health_metrics hm ON p.participant_id = hm.participant_id
JOIN lifestyle_metrics lm ON p.participant_id = lm.participant_id;

-- =====================================================
-- Exploratory Data Analysis Aggregation View
-- =====================================================
-- Purpose: Groups participants by coffee intake category and stress level,
-- exposing average health indicators per group. Useful for exploratory
-- analysis of how lifestyle patterns relate to health outcomes, and as a
-- sanity-check that the relational joins are producing correct results.

CREATE VIEW vw_coffee_health_aggregates AS
SELECT
    CASE
        WHEN cc.coffee_intake_cups_per_day = 0          THEN 'None'
        WHEN cc.coffee_intake_cups_per_day BETWEEN 1 AND 2 THEN 'Low (1-2 cups)'
        WHEN cc.coffee_intake_cups_per_day BETWEEN 3 AND 4 THEN 'Moderate (3-4 cups)'
        ELSE 'High (5+ cups)'
    END AS coffee_intake_category,
    lm.stress_level,
    COUNT(p.participant_id)                              AS participant_count,
    ROUND(AVG(p.age)::NUMERIC, 1)                        AS avg_age,
    ROUND(AVG(cc.caffeine_mg_per_day)::NUMERIC, 1)       AS avg_caffeine_mg,
    ROUND(AVG(sm.sleep_hours)::NUMERIC, 2)               AS avg_sleep_hours,
    ROUND(AVG(hm.bmi)::NUMERIC, 2)                       AS avg_bmi,
    ROUND(AVG(hm.heart_rate_bpm)::NUMERIC, 1)            AS avg_heart_rate_bpm,
    ROUND(AVG(lm.physical_activity_hours)::NUMERIC, 2)   AS avg_physical_activity_hours
FROM participants p
JOIN coffee_consumption cc  ON p.participant_id = cc.participant_id
JOIN sleep_metrics sm       ON p.participant_id = sm.participant_id
JOIN health_metrics hm      ON p.participant_id = hm.participant_id
JOIN lifestyle_metrics lm   ON p.participant_id = lm.participant_id
GROUP BY coffee_intake_category, lm.stress_level
ORDER BY coffee_intake_category, lm.stress_level;