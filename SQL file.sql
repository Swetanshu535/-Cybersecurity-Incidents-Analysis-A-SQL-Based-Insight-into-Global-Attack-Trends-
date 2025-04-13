create database cyber_security;
use cyber_security;

select * from cyber;

-- General Analysis
-- Top 5 Countries with the Most Cyberattacks
select Country,Incident_Resolution
from cyber
order by Incident_Resolution desc
Limit 5;
-- Year-wise Trend of Cyber Incidents
select Year,Attack_Type,Incident_Resolution,Attack_Source
from cyber;
-- Top 3 Most Common Attack Types
select Attack_Type,count(*) as C
from cyber
group by Attack_Type
order by C desc
limit 3;

-- Financial & User Impact
-- Industry-wise Average Financial Loss
select Target_Industry,Financial_Loss
from cyber;
-- Total Users Affected by Attack Type
select Attack_Type,Number_Users
from cyber;
-- Which country faced the highest financial loss overall?
select Country,Financial_Loss
from cyber;
-- Security & Defense Analysis
-- Effectiveness of Defense Mechanisms (Based on Incident Resolution)
select Defense_Mechanism, Incident_Resolution
from cyber;
-- Which security type is most used in high-loss incidents?
select Security_Type,Financial_Loss
from cyber;

-- Source-Based Insights
-- Compare Internal vs External Attack Sources
select Attack_Source, count(*) as C, sum(Financial_Loss) as total
from cyber
group by Attack_Source;
-- Most targeted industries by external attacks
select Target_Industry,count(*) as External_Attacks, Attack_Source
from cyber
where Attack_Source= "Unknown"
group by Target_Industry
