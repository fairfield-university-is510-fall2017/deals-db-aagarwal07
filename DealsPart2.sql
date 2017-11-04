# Deals Alok Agarwal 11/04/2017
USE Deals;

# 9 Create a view named DealValues that lists the DealID, total dollar value and number of parts for each deal.
drop view if exists DealValues;
create view DealValues AS
SELECT DEALS.DealID, SUM(DollarValue) AS TotDollarValue, COUNT(PartNumber) AS Numparts
FROM DEALS JOIN DEALPARTS ON (DEALS.DealID = DEALPARTS.DealID)
GROUP BY DEALS.DealID
ORDER BY DEALS.DealID;

SELECT * from DealValues;

# 10 Create a view named DealSummary that lists the DealID, DealName, number of players, total dollar value, and number of parts for each deal.

DROP VIEW IF EXISTS DealSummary;
CREATE vIEW DealSummary AS
SELECT Deals.DealID, DealName, COUNT(PlayerID) AS NumPLayers, TotDollarValue, Numparts
FROM DEALS JOIN DealValues ON (Deals.DealID = DealValues.DealID)
             JOIN Players ON (DEALS.DealID = Players.DealID)
GROUP BY Deals.DealID;

# 11. Create a view called DealsByType that lists TypeCode, number of deals, and total value of deals for each deal type.

DROP VIEW IF EXISTS DealsByType;
CREATE VIEW DealsByType AS
SELECT DISTINCT DealTypes.TypeCode, COUNT(Deals.DealID) AS NumDeals, SUM(DealParts.DollarValue) AS TotDollarValue
FROM DealTypes
    LEFT JOIN Deals ON (DealTypes.DealID = Deals.DealID)
    JOIN DealParts ON (DealParts.DealID = Deals.DealID)
GROUP BY DealTypes.TypeCode;

#12 Create a view called DealPlayers that lists the CompanyID, Name, and Role Code for each deal. Sort the players by the RoleSortOrder.
DROP VIEW IF EXISTS DealPlayers;
CREATE VIEW DealPlayers AS
SELECT DealID, CompanyID, CompanyName, RoleCode
FROM Players
         JOIN Deals USING (DealID)
         JOIN COMPANIES USING (CompanyID)
         JOIN ROLECODES USING (RoleCode)
ORDER BY RoleSortOrder;

#13 Create a view called DealsByFirm that lists the FirmID, Name, number of deals, and total value of deals for each firm.
DROP VIEW IF EXISTS `DealsByFirm`;
CREATE VIEW `DealsByFirm` AS 
SELECT FirmID, `Name` AS FirmName, COUNT(PLAYERS.DealID) AS NumPlayers, SUM(TotDollarValue) AS TotValue
FROM FIRMS
	LEFT JOIN PLAYERSUPPORTS USING (FirmID)
    LEFT JOIN PLAYERS USING (PlayerID)
    LEFT JOIN DealValues USING (DealID)
GROUP BY FirmID, `Name`;