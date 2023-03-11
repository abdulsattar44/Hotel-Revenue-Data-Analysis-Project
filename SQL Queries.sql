WITH Hotels AS (
	SELECT * FROM dbo.['2018$']
	UNION 
	SELECT * FROM dbo.['2019$']
	UNION
	SELECT * FROM dbo.['2020$']
)

-- Exploratory Data Analysis
SELECT  
	arrival_date_year,
	hotel,
	ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr ), 2) AS Revenue
FROM Hotels
GROUP BY arrival_date_year, hotel


-- JOINING with market segment and meal cost tables
WITH Hotels AS (
	SELECT * FROM dbo.['2018$']
	UNION 
	SELECT * FROM dbo.['2019$']
	UNION
	SELECT * FROM dbo.['2020$']
)
SELECT *
	FROM Hotels
LEFT JOIN dbo.market_segment$
	ON Hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
	ON meal_cost$.meal = Hotels.meal