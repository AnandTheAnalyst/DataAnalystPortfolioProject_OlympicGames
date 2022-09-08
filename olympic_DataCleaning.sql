SELECT 
  [ID], 
  [Name] AS 'Competitor Name' --- Renamed Column
  , 
  Case When Sex = 'M' THEN 'Male' ELSE 'FEMALE' END AS SEX --  Better Name for filtrer & visualizations
  , 
  [Age], 
  CASE WHEN [AGE] < 18 THEN 'Under 18' WHEN [Age] Between 18 
  AND 25 THEN '18-25' WHEN [Age] Between 25 
  AND 30 THEN '25-30' WHEN [Age] > 30 THEN 'OVER 30' END as [Age Grouping], 
  [Height], 
  [Weight], 
  [NOC] As 'Nation Code' --  To exlain the Abbrevation
  --,[Games]
  , 
  LEFT(
    Games, 
    CHARINDEX(' ', Games)-1
  ) as 'Year' -- Extract the Year from Gemas Column
  , 
  SUBSTRING(
    Games, 
    CHARINDEX(' ', Games)+ 1, 
    LEN(Games)
  ) as Season --Extract the Season from the Games column
  --,[City]Commented out as it is not neccessary for the analysis
  , 
  [Sport], 
  [Event], 
  CASE WHEN [Medal] = 'NA' THEN 'Not Registered' ELSE Medal END as Medal -- Replace NA with NOT REGISTERED
FROM 
  [Olympic_Games].[dbo].[athletes_event_results] 
Where 
  SUBSTRING(
    Games, 
    CHARINDEX(' ', Games)+ 1, 
    LEN(Games)
  ) = 'Summer' -- Where clause to filter the Summer Season
