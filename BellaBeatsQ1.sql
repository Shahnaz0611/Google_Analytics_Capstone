-- CALCULATING NUMBER OF USERS AND DAILY AVERAGE MEASURES


---1 TRACKING THEIR PHYSICAL ACTIVITIES

SELECT 
	COUNT(DISTINCT Id) AS num_users_activity_track,
	AVG(TotalSteps) AS avg_steps,
	AVG(TotalDistance) AS avg_distance,
	AVG(Calories) As avg_calories
FROM 
	BellaBeats.dbo.dailyActivity

---1.1 TRACKING THE PHYSICAL ACTIVITY OF 33 DISTINCT USERS 
SELECT
    Id,
    SUM(TotalSteps) AS total_steps,
    SUM(TotalDistance) AS total_distance,
    SUM(Calories) AS total_calories
FROM 
    BellaBeats.dbo.dailyActivity
GROUP BY Id;

---2 TRACKING HEART RATE FOR NUMBER OF USERS  

SELECT 
	COUNT(DISTINCT Id) AS num_user_heartrate_track,
	AVG(Value) AS average_heartRate,
	MIN(Value) AS min_heartRate,
	MAX(Value) AS max_heartRate
 FROM
	BellaBeats.dbo.heartrate


---2.1 TRACKING HEART RATE FOR INDIVIDUAL USERS  

SELECT 
	Id,
	AVG(Value) AS usr_average_heartRate,
	MIN(Value) AS usr_min_heartRate,
	MAX(Value) AS usr_max_heartRate

FROM
	BellaBeats.dbo.heartrate

GROUP BY Id;

---3 TRACKING SLEEP

SELECT 
	COUNT(DISTINCT Id) AS num_user_sleep_track,
	AVG(TotalMinutesAsleep)/60 AS average_sleep_in_minutes,
	MAX(TotalMinutesAsleep)/60 AS max_sleep_in_minutes,
	MIN(TotalMinutesAsleep)/60 AS min_sleep_in_minutes,
	AVG(TotalTimeInBed)/60 AS average_time_in_bed
FROM
	BellaBeats.dbo.sleepDay

----3.1 TRACKING SLEEP PATTERN FOR INDIVDUAL USER

SELECT 
	Id,
	AVG(TotalMinutesAsleep)/60 AS usr_average_sleeptime,
	MAX(TotalMinutesAsleep)/60 AS usr_max_sleeptime,
	MIN(TotalMinutesAsleep)/60 AS usr_min_sleeptime,
	AVG(TotalTimeInBed)/60 AS usr_average_time_in_bed
FROM
	BellaBeats.dbo.sleepDay
GROUP BY Id;

---4 TRACKING WEIGHT

SELECT 
	COUNT(DISTINCT Id) AS num_user_sleep_track,
	AVG(WeightKg) AS avg_weight_in_kg,
	MIN(WeightKg) AS min_weight_in_kg,
	MAX(WeightKg) AS max_weight_in_kg

FROM 
	BellaBeats.dbo.weightLogInfo

---4.1 TRACKING INDIVISUAL USER WEIGHT

SELECT 
	Id,
	AVG(WeightKg) AS usr_avg_weight,
	MIN(WeightKg) AS usr_min_weight,
	MAX(WeightKg) AS usr_max_weight
	
FROM 
	BellaBeats.dbo.weightLogInfo

GROUP BY Id;



