--CALCULATE THE NUMBER OF DAYS EACH USER TRACKED PHYSICAL ACTIVITY

SELECT 
	DISTINCT Id,
	COUNT(ActivityDate) OVER (PARTITION BY Id) AS activity_days_recorded
FROM 
	BellaBeats.dbo.dailyActivity

ORDER BY activity_days_recorded DESC

-- CALCULATE AVERAGE MINUTES FOR EACH ACTIVITY

SELECT 
	Id,
	ROUND(AVG(VeryActiveMinutes)/60, 2) AS avg_very_active,
	ROUND(AVG(FairlyActiveMinutes)/60, 2) AS avg_fairly_active,
	ROUND(AVG(LightlyActiveMinutes)/60, 2) AS avg_lightly_active,
	ROUND(AVG(SedentaryMinutes)/60, 2) AS avg_sedentary_hours
FROM 
	BellaBeats.dbo.dailyActivity
GROUP BY Id;

--DETERMINING TIME WHEN USERS WERE MOSTLY ACTIVE

SELECT 
	DISTINCT (CAST(ha.ActivityHour AS TIME)) AS activity_time,
	AVG(ha.TotalIntensity) OVER (PARTITION BY DATEPART(HOUR, ha.ActivityHour)) AS avg_intensity,
	AVG(mm.METs/10.0) OVER (PARTITION BY DATEPART(HOUR, mm.ActivityMinute)) AS avg_METs

FROM 
	BellaBeats.dbo.hourlyActivity AS ha
	JOIN 
	BellaBeats.dbo.minuteMETs AS mm
	ON ha.Id=mm.Id AND
	ha.ActivityHour=mm.ActivityMinute
ORDER BY avg_intensity DESC

