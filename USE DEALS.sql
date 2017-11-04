USE deals;
SELECT *
FROM Companies
WHERE CompanyName like "%Inc.";


SELECT *
FROM Companies
ORDER BY CompanyID;

# Select Deal Parts with Dollar values
SELECT DealName, PartNumber, DollarValue
FROM Deals,DealParts
WHERE Deals.DealID = DealParts.DealID;

#Select Deal Parts with Dollar Values using a join
SELECT DealName, PartNumber, DollarValue
FROM Deals join DealParts on (Deals.DealID=DealParts.DealID);