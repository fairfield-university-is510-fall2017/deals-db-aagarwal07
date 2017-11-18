/** Adding foriegn keys to each table as indicated by ERD in part 2**/
USE deals;

ALTER TABLE `dealtypes`  
  ADD FOREIGN KEY (`TypeCode`)
    REFERENCES `typecodes` (`TypeCode`);
    
ALTER TABLE `dealtypes`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `deals` (`DealID`);
 
 ALTER TABLE `dealparts`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `deals` (`DealID`);

ALTER TABLE `players`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `deals` (`DealID`);

ALTER TABLE `players`  
  ADD FOREIGN KEY (`CompanyID`)
    REFERENCES `Companies` (`CompanyID`);

ALTER TABLE `players`  
  ADD FOREIGN KEY (`RoleCode`)
    REFERENCES `rolecodes` (`RoleCode`);

ALTER TABLE `playersupports`  
  ADD FOREIGN KEY (`FirmID`)
    REFERENCES `firms` (`FirmID`);

ALTER TABLE `playersupports`  
  ADD FOREIGN KEY (`SupportCodeID`)
    REFERENCES `supportcodes` (`SupportCodeID`);

ALTER TABLE `playersupports`  
  ADD FOREIGN KEY (`PlayerID`)
    REFERENCES `players` (`PlayerID`);
