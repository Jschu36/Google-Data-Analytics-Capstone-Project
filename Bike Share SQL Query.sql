-- Create table containing yearly data
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
INTO Yearly_Data
FROM
January_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
February_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
March_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
April_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
May_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
June_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
July_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
August_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
September_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
October_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
November_Data
UNION
SELECT 
ride_id, 
rideable_type, 
started_at, 
ended_at, 
member_casual, 
DATEDIFF(minute, started_at, ended_at) as ride_duration,
day_of_week,
month_of_year
FROM
December_Data

SELECT *
FROM Yearly_Data
ORDER BY started_at



-- Create table containing number of rides per month
SELECT month_of_year, member_casual, COUNT(ride_id) as number_of_rides
INTO rides_per_month
FROM Yearly_Data
GROUP BY month_of_year, member_casual

SELECT *
FROM rides_per_month
ORDER BY month_of_year



-- Create table containing number of rides per weekday
SELECT day_of_week, member_casual, COUNT(ride_id) as number_of_rides
INTO rides_per_day
FROM Yearly_Data
GROUP BY day_of_week, member_casual

SELECT *
FROM rides_per_day
ORDER BY day_of_week



--Create table containing uses of bike type
SELECT rideable_type, member_casual, COUNT(ride_id) as number_of_rides
INTO bike_type
FROM Yearly_Data
GROUP BY rideable_type, member_casual

SELECT *
FROM bike_type



--Create table for Average trip duration
SELECT member_casual, AVG(ride_duration) as avg_ride_duration
INTO avg_trip_duration
FROM Yearly_Data
GROUP BY member_casual

SELECT *
FROM avg_trip_duration



--Create table containing average trip duration per month
SELECT month_of_year, member_casual, AVG(ride_duration) as avg_ride_duration
INTO monthly_trip_duration
FROM Yearly_Data
GROUP BY month_of_year, member_casual

SELECT *
FROM monthly_trip_duration



--Create table containing average trip duration per weekday
SELECT day_of_week, member_casual, AVG(ride_duration) as avg_ride_duration
INTO daily_trip_duration
FROM Yearly_Data
GROUP BY day_of_week, member_casual

SELECT *
FROM daily_trip_duration