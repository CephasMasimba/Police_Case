--(1)We are going to display all records from the Criminal Cases Table

 SELECT * from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database];

--(2)Count the total number of cases in the table

select count(*) from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]

--(3)Counting the number cases in each province

select province, Count (*) AS number_of_cases
from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
group by province;

--(4)Retrieve all cases where the crime tyoe is fraud

select * from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
where CrimeType = 'fraud';

--(5)Count the number of cases for each crime type is fraud

select  CrimeType,count(*) AS number_0f_cases
from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
group by CrimeType;

--(6)Display all cases classified as High or Critical risk

select * from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
where RiskLevel = 'high risk' OR RiskLevel = 'critical risk';

--(7)Calculate the average Financial Score of all suspects

   select AVG (FinancialScore)
   from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database];

--(8)Find the highest Estimated Fraud Amount recorded.
  
  select MAX (EstimatedFraudAmount_ZAR)
  from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database];
    
--(9)Retrieve the top 10 cases with the highest Estimated Fraud Amount.

  select TOP 10 *
  from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
  ORDER BY EstimatedFraudAmount_ZAR DESC;
    

--(10)Display all cases where the suspect was arrested.

   
   select * from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   WHERE Arrested = 'Yes';

  --(11)Count how many suspects were arrested versus not arrested.

      select COUNT (*)
      from[Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
      WHERE Arrested = 'Yes';


      --(12)Count the number of cases associated with each bank.

      select BankInvolved, Count(*) AS case_associated
      from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
      GROUP BY BankInvolved
      ORDER BY case_associated DESC;


--(13)Calculate the total Estimated Fraud Amount per province.

     select Province,SUM (EstimatedFraudAmount_ZAR) AS total_estimated_fraud_amount_per_province
     from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
     GROUP BY Province
     ORDER BY total_estimated_fraud_amount_per_province;
     
14.-- Retrieve all suspects older than 50 years.

      select *
      from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
      WHERE Age > 50;
      
--(15)Calculate the average age of suspects per province.

   select Province, AVG (Age) AS average_age
   from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   GROUP BY Province;

 --(16) Display all cases recorded from 2020 onwards.

 select *
 from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
 WHERE CrimeDate >= ' 2020-01-01';

--(17)Count how many cases resulted in a Convicted status.

  select Count (*) AS convicted_status
  from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
  WHERE CaseStatus = 'convicted';

--(18)Retrieve all suspects with more than three previous offenses.

  select *
  from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
  WHERE PreviousOffenses >= 3;

--(19)Show the distribution of cases by Risk Level.

   
    SELECT 
    RiskLevel,
    COUNT(*) AS case_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
GROUP BY RiskLevel
ORDER BY 
    CASE RiskLevel
        WHEN 'High'   THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'Low'    THEN 3
        ELSE 4
    END;
                
                
--(20)Calculate the total Estimated Fraud Amount across all cases.
 
 SELECT 
    SUM(CAST(EstimatedFraudAmount_ZAR AS DECIMAL(18,2))) AS total_fraud_amount_ZAR
FROM [Police_Case].[dbo].[1771531742947_south_africa_criminal_database];


--(21)Retrieve the youngest suspect in the dataset.

   select TOP 1*
   from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   ORDER BY AGE ASC;

   --(22). Identify the province with the highest number of cases.

   Select TOP 1 Province,
   COUNT  (*) AS number_of_cases
   from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   GROUP BY Province
   ORDER BY number_of_cases DESC;

   


    --(23)Retrieve the oldest suspect in the dataset.

   SELECT TOP 1*
   from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   ORDER BY AGE DESC;


--(24)Count the number of cases handled by each investigating officer.
   
   select InvestigatingOfficer,
   Count (*) AS number_of_cases
   from  [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   GROUP BY InvestigatingOfficer
   ORDER BY number_of_cases DESC;

--(25)Calculate the average Estimated Fraud Amount per crime type. 

  SELECT 
    CrimeType,
    AVG(CAST(EstimatedFraudAmount_ZAR AS DECIMAL(18,2))) AS avg_fraud_amount
FROM [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
GROUP BY CrimeType
ORDER BY avg_fraud_amount DESC;

   
--(26)Display all cases occurring in Gauteng province.

   select *
   from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
   WHERE Province = 'Gauteng';


    
--(27)Retrieve all Fraud cases classified as High risk.

  select *
  from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
  WHERE RiskLevel = 'High';

--(28) the number of cases per year based on CrimeDate.

SELECT 
    YEAR(CrimeDate) AS crime_year,
    COUNT(*) AS number_of_cases
FROM [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
GROUP BY YEAR(CrimeDate)
ORDER BY crime_year ASC;



--(29)Display all suspects with a Financial Score below 500.

select *
from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
WHERE FinancialScore < 500;

--(30)Identify the most common Crime Type in the dataset.

 select CrimeType,
 COUNT (*) AS number_cases
 from [Police_Case].[dbo].[1771531742947_south_africa_criminal_database]
GROUP BY CrimeType
ORDER BY number_cases;




