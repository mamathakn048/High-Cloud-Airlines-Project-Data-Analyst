create database Airline;
use Airline;

desc final_maindata_group4;

#--Total Number of Flights
SELECT COUNT(*) AS Total_Flights
FROM final_maindata_group4;

#---Total Number of Passengers
SELECT 
    ROUND(SUM(`# Transported Passengers`) / 1000000, 2) AS Total_Passengers_Million
FROM final_maindata_group4;


#--Average Load Factor
SELECT 
    ROUND((SUM(`# Transported Passengers`) * 100.0) / NULLIF(SUM(`# Available Seats`), 0), 2) AS Avg_Load_Factor_Percentage
FROM final_maindata_group4;



#---Year----
SELECT 
    Year AS Year 
FROM final_maindata_group4;

SELECT 
    "Month (#)" AS MonthNo 
FROM final_maindata_group4;

SELECT 
    TO_CHAR(DATE_TRUNC('MONTH', CAST(CONCAT(Year, '-', LPAD(`Month (#)`, 2, '0'), '-', LPAD(Day, 2, '0')) AS DATE)), 'Month') AS MonthFullName 
FROM final_maindata_group4;

SELECT 
    CASE 
        WHEN `Month (#)` BETWEEN 1 AND 3 THEN 'Q1'
        WHEN `Month (#)` BETWEEN 4 AND 6 THEN 'Q2'
        WHEN `Month (#)` BETWEEN 7 AND 9 THEN 'Q3'
        WHEN `Month (#)` BETWEEN 10 AND 12 THEN 'Q4'
    END AS Quarter 
FROM final_maindata_group4;



#--- Date Field 
SELECT 
    STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d') AS DateField
FROM final_maindata_group4;

#-- Year
SELECT 
    YEAR(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) AS Year 
FROM final_maindata_group4;

#-- Month number
SELECT 
    MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) AS MonthNo
FROM final_maindata_group4;

#---MonthFullName
SELECT 
    DATE_FORMAT(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d'), '%M') AS MonthFullName
FROM final_maindata_group4;


#-- Quarter
SELECT 
    CASE 
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 7 AND 9 THEN 'Q3'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 10 AND 12 THEN 'Q4'
    END AS Quarter
FROM final_maindata_group4;

#-- YearMonth
SELECT 
    DATE_FORMAT(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d'), '%Y-%b') AS YearMonth
FROM final_maindata_group4;

#--WeekdayNo
SELECT 
    DAYOFWEEK(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) AS WeekdayNo
FROM final_maindata_group4;

#-- WeekdayName
SELECT 
    DATE_FORMAT(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d'), '%W') AS WeekdayName
FROM final_maindata_group4;

#---FinancialMonth
SELECT 
    CASE 
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) >= 4 
        THEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) - 3
        ELSE MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) + 9
    END AS FinancialMonth
FROM final_maindata_group4;

#-- FinancialQuarter
SELECT 
    CASE 
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 4 AND 6 THEN 'Q1'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 7 AND 9 THEN 'Q2'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 10 AND 12 THEN 'Q3'
        WHEN MONTH(STR_TO_DATE(CONCAT(Year, '-', `Month (#)`, '-', Day), '%Y-%m-%d')) BETWEEN 1 AND 3 THEN 'Q4'
    END AS FinancialQuarter
FROM final_maindata_group4;

#-- Year Quarter Month
SELECT 
    YEAR(STR_TO_DATE(`date`, '%m/%d/%Y')) AS Year,
    QUARTER(STR_TO_DATE(`date`, '%m/%d/%Y')) AS Quarter,
    MONTH(STR_TO_DATE(`date`, '%m/%d/%Y')) AS Month
FROM final_maindata_group4;

#--Load Factor Percentage by Carrier Name
SELECT 
    `Carrier Name`,
    SUM(`# Transported Passengers`) AS Total_Transported,
    SUM(`# Available Seats`) AS Total_Available,
    (SUM(`# Transported Passengers`) * 100.0) / NULLIF(SUM(`# Available Seats`), 0) AS Load_Factor_Percentage
FROM final_maindata_group4
GROUP BY `Carrier Name`
ORDER BY Load_Factor_Percentage DESC;

#-- Top 10 Carrier Names
SELECT 
    `Carrier Name`,
    SUM(`# Transported Passengers`) AS Total_Passengers
FROM final_maindata_group4
GROUP BY `Carrier Name`
ORDER BY Total_Passengers DESC
LIMIT 10;

#--Top Routes
SELECT 
    `From - To City`,
    COUNT(*) AS Total_Flights
FROM final_maindata_group4
GROUP BY `From - To City`
ORDER BY Total_Flights DESC
LIMIT 10;

#--Number of Flights Based on Distance Group
SELECT 
    `%Distance Group ID` AS Distance_Group,
    COUNT(*) AS Total_Flights
FROM final_maindata_group4
GROUP BY `%Distance Group ID`
ORDER BY Total_Flights DESC;


#--Top 10 Airlines by Passenger Count
SELECT 
    `Carrier Name`,
    SUM(`# Transported Passengers`) AS Total_Passengers
FROM final_maindata_group4
GROUP BY `Carrier Name`
ORDER BY Total_Passengers DESC
LIMIT 10;

