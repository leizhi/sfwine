CREATE TABLE `CardWinery` (
  `id` int(11) NOT NULL DEFAULT '0',
  `cardTypeKey` varchar(20) DEFAULT NULL,
  `cardTypeName` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cardTypeKey` (`cardTypeKey`),
  KEY `cardTypeName` (`cardTypeName`),
  KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/* update SQL 1*/
use wineBranch;
alter table Card add `cardDate` datetime DEFAULT NULL;
alter table Card add index cardDate(`cardDate`);
update Card a INNER JOIN(select cardId,trackDate from  CardTrack where statusId=1) b ON a.id=b.cardId set a.cardDate=b.trackDate;
alter table Card add `userId` int(11) DEFAULT NULL;
update Card a INNER JOIN(select cardId,userId from  CardTrack where statusId=1) b ON a.id=b.cardId set a.userId=b.userId;
drop table CardTrack;
use wineShared;
drop table CardStatus;
use wineBranch;
alter table CardJob add `processId` int(11) DEFAULT NULL;
set @LastId=0;
SELECT MAX(ID) INTO @LastId FROM CardJob;
insert into CardJob(id,jobDate,userId,cardId,jobTypeId,spotNormal,cardNormal,isPost,processId) select id+@LastId,cardDate,userId,id,1,'Y','Y','A',1 from Card;

update CardJob a INNER JOIN(select cardId,count(id) cid from  CardJob group by  cardId) b ON a.cardId=b.cardId set a.processId=b.cid-1;
update CardJob a INNER JOIN(select max(jobDate) mid from  CardJob group by  cardId) b ON a.jobDate=b.mid set a.processId=0;
update CardJob a INNER JOIN(select id from  CardJob where jobTypeId=1 and processId>0) b ON a.id=b.id set a.processId=1;
alter table Card drop `userId`;
alter table Card drop `cardDate`;
alter table WineJar drop FOREIGN KEY `WineJar_ibfk_1`;
alter table WineJar drop `branchId`;
use wineShared;
insert into Branch values();
use wineBranch;
insert into Winery values();

alter table AddressBook add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table AddressBook add index `branchId`(`branchId`) ;
alter table Card add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table Card add index `branchId`(`branchId`) ;
alter table CardJob add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table CardJob add index `branchId`(`branchId`) ;
alter table CardJobImage add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table CardJobImage add index `branchId`(`branchId`) ;
alter table UserImage add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table UserImage add index `branchId`(`branchId`) ;
alter table UserInfo add `branchId` int(11)  NOT NULL DEFAULT '0';
alter table UserInfo add index `branchId`(`branchId`) ;

/* update SQL 2*/
SET FOREIGN_KEY_CHECKS = 0;
update Card a INNER JOIN(select id,branchId from  Winery) b ON a.wineryId=b.id set a.branchId=b.branchId;
update CardJob a INNER JOIN(select id,branchId from  Card) b ON a.cardId=b.id set a.branchId=b.branchId;
update WineJar a INNER JOIN(select id,branchId from  Winery) b ON a.wineryId=b.id set a.branchId=b.branchId;
update UserInfo a INNER JOIN(select id,branchId from  User) b ON a.userId=b.id set a.branchId=b.branchId;
update WineryMap a INNER JOIN(select id,branchId from  Winery) b ON a.wineryId=b.id set a.branchId=b.branchId;
update GroupMember a INNER JOIN(select id,branchId from  wineFrameWork.WorkGroup) b ON a.groupId=b.id set a.branchId=b.branchId;

update CardJob a INNER JOIN(select cardId,count(id) cid from  CardJob group by  cardId) b ON a.cardId=b.cardId set a.processId=b.cid-1;
update CardJob a INNER JOIN(select max(jobDate) mid from  CardJob group by  cardId) b ON a.jobDate=b.mid set a.processId=0;
update CardJob a INNER JOIN(select id from  CardJob where jobTypeId=1 and processId>0) b ON a.id=b.id set a.processId=1;

SET FOREIGN_KEY_CHECKS = 1;


//

SELECT card.id,card.rfidcode,card.uuid,card.wineJarId,card.position,winery.definition,
wineJar.jarNumber,cardJob.jobDate,jobType.definition,user.name,cardType.cardTypeName
FROM wineShared.JobType jobType,wineBranch.WineJar wineJar,wineBranch.CardJob cardJob,
wineBranch.Card card,wineShared.CardType cardType,wineBranch.User user,
wineBranch.Winery winery WHERE card.cardTypeId=cardType.id AND card.wineJarId=wineJar.id 
AND card.wineryId=wineJar.wineryId AND card.branchId=wineJar.branchId AND wineJar.wineryId=winery.id 
AND wineJar.branchId=winery.branchId AND cardJob.cardId=card.id AND cardJob.branchId=card.branchId 
AND cardJob.userId=user.id AND cardJob.branchId=user.branchId AND jobType.id=cardJob.jobTypeId 
AND cardJob.processId=0 AND cardJob.jobDate >= '2012-11-05' AND cardJob.jobDate <= '2012-12-05' 
AND  winery.id IN (2,4) AND winery.branchId=4 ORDER BY cardJob.id DESC

//
update CardJob a INNER JOIN(select id,branchId from  Card where branchId=4 and wineryId=5) b ON a.cardId=b.id and a.branchId=b.branchId set a.jobTypeId=1 WHERE a.jobTypeId=3;

//update database v1.2
CREATE TABLE `WineryState` (
  `id` int(11) NOT NULL DEFAULT '0',
  `abbreviation` varchar(5) DEFAULT NULL,
  `definition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abbreviation` (`abbreviation`),
  KEY `definition` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table Winery add `stateId` int(11) DEFAULT NULL;
alter table Winery add index `stateId`(`stateId`);
alter table Winery add CONSTRAINT `Winery_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `wineShared`.`WineryState` (`id`);

//update database v1.3
CREATE TABLE `UserType` (
  `id` int(11) NOT NULL DEFAULT '0',
  `abbreviation` varchar(5) DEFAULT NULL,
  `definition` varchar(50) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abbreviation` (`abbreviation`),
  KEY `definition` (`definition`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `UserType_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `BranchCategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

use wineBranch;

alter table UserInfo add `typeId` int(11) DEFAULT NULL;
alter table UserInfo add index `typeId`(`typeId`);
alter table UserInfo add CONSTRAINT `UserInfo_ibfk_8` FOREIGN KEY (`typeId`) REFERENCES `wineShared`.`UserType` (`id`);

//update database v1.4
CREATE TABLE `ForgeryCode` (
  `id` int(11) NOT NULL DEFAULT '0',
  `forgeryCode` varchar(50) DEFAULT NULL,
  `forgeryName` varchar(50) DEFAULT NULL,
  `alcohol` decimal(5,2) DEFAULT NULL,
  `volume` decimal(5,2) DEFAULT NULL,
  `unitId` int(11) DEFAULT NULL,
  `placeOrigin` varchar(255) DEFAULT NULL,
  `vintageDate` date DEFAULT NULL,
  `packagingDate` date DEFAULT NULL,
  `onDate` date DEFAULT NULL,
  `offDate` date DEFAULT NULL,
   `price` decimal(25,4) DEFAULT NULL,
  `orgCurrencyId` int(11) DEFAULT NULL,
  `isConfirm` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `forgeryCode` (`forgeryCode`),
  KEY `forgeryName` (`forgeryName`),
  KEY `alcohol` (`alcohol`),
  KEY `volume` (`volume`),
  KEY `unitId` (`unitId`),
  KEY `placeOrigin` (`placeOrigin`),
  KEY `vintageDate` (`vintageDate`),
  KEY `packagingDate` (`packagingDate`),
  KEY `onDate` (`onDate`),
  KEY `offDate` (`offDate`),
  KEY `price` (`price`),
  KEY `orgCurrencyId` (`orgCurrencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//update database v1.5
CREATE TABLE `ProductCategory` (
  `id` int(11) NOT NULL DEFAULT '0',
  `categoryCode` varchar(32) DEFAULT NULL,
  `categoryName` varchar(64) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `categoryCode` (`categoryCode`),
  KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ProductType` (
  `id` int(11) NOT NULL DEFAULT '0',
  `categoryId` int(11) DEFAULT NULL,
  `typeCode` varchar(32) DEFAULT NULL,
  `typeName` varchar(64) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `typeCode` (`typeCode`),
  KEY `typeName` (`typeName`),
  KEY `ProductType_ibfk_1` (`categoryId`),
  CONSTRAINT `ProductType_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `ProductCategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `Product`;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL DEFAULT '0',
  `typeId` int(11) DEFAULT NULL,
  `productCode` varchar(32) DEFAULT NULL,
  `productName` varchar(64) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `weightUnitId` int(11) DEFAULT NULL,
  `volume` decimal(5,2) DEFAULT NULL,
  `volumeUnitId` int(11) DEFAULT NULL,
  `productionDate` date DEFAULT NULL,
  `factoryDate` date DEFAULT NULL,
  `placeOrigin` varchar(255) DEFAULT NULL,
  `onDate` date DEFAULT NULL,
  `offDate` date DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `costPrice` decimal(25,4) DEFAULT NULL,
  `costCurrId` int(11) DEFAULT NULL,
  `memberPrice` decimal(25,4) DEFAULT NULL,
  `memberCurrId` int(11) DEFAULT NULL,
  `retailPrice` decimal(25,4) DEFAULT NULL,
  `retailCurrId` int(11) DEFAULT NULL,
  `isPost` enum('Y','N','C') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  KEY `productCode` (`productCode`),
  KEY `productName` (`productName`),
  KEY `weight` (`weight`),
  KEY `weightUnitId` (`weightUnitId`),
  KEY `volume` (`volume`),
  KEY `volumeUnitId` (`volumeUnitId`),
  KEY `productionDate` (`productionDate`),
  KEY `factoryDate` (`factoryDate`),
  KEY `placeOrigin` (`placeOrigin`),
  KEY `onDate` (`onDate`),
  KEY `offDate` (`offDate`),
  KEY `createDate` (`createDate`),
  KEY `costPrice` (`costPrice`),
  KEY `costCurrId` (`costCurrId`),
  KEY `memberPrice` (`memberPrice`),
  KEY `memberCurrId` (`memberCurrId`),
  KEY `retailPrice` (`retailPrice`),
  KEY `retailCurrId` (`retailCurrId`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `ProductType` (`id`),
  CONSTRAINT `Product_ibfk_2` FOREIGN KEY (`weightUnitId`) REFERENCES `Unit` (`id`),
  CONSTRAINT `Product_ibfk_3` FOREIGN KEY (`volumeUnitId`) REFERENCES `Unit` (`id`),
  CONSTRAINT `Product_ibfk_4` FOREIGN KEY (`costCurrId`) REFERENCES `Currency` (`id`),
  CONSTRAINT `Product_ibfk_5` FOREIGN KEY (`memberCurrId`) REFERENCES `Currency` (`id`),
  CONSTRAINT `Product_ibfk_6` FOREIGN KEY (`retailCurrId`) REFERENCES `Currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Reserve` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `direction` enum('+','-') DEFAULT NULL,
  `isPost` enum('Y','N','C') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `quantity` (`quantity`),
  KEY `toDate` (`toDate`),
  CONSTRAINT `Reserve_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `FileInfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'NULL',
  `datetime` datetime DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `folder` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dateTime` (`datetime`),
  KEY `filepath` (`filepath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

//update database v1.6
alter table User add `typeId` int(11) DEFAULT NULL;
alter table User add index `typeId`(`typeId`);
alter table User add CONSTRAINT `User_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `wineShared`.`UserType` (`id`);
alter table User add `mobile` char(11) DEFAULT NULL;
alter table User add index `mobile`(`mobile`);
update User set typeId=2;

ALTER TABLE WorkGroup  DROP PRIMARY KEY,ADD PRIMARY KEY ( `id` );

//update database v1.7

CREATE TABLE `JobState` (
  `id` int(11) NOT NULL DEFAULT '0',
  `shortName` varchar(5) DEFAULT NULL,
  `fullName` varchar(10) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `shortName` (`shortName`),
  KEY `fullName` (`fullName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table WineJar drop FOREIGN KEY `WineJar_ibfk_8`;
alter table WineJar add CONSTRAINT `WineJar_ibfk_8` FOREIGN KEY (`stateId`) REFERENCES `wineShared`.`JobState` (`id`);
update WineJar set stateId=3 where stateId=2;
update WineJar set stateId=2 where stateId=1;

alter table Winery drop FOREIGN KEY `Winery_ibfk_2`;
alter table Winery add CONSTRAINT `Winery_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `wineShared`.`JobState` (`id`);

update Card set wineJarId=NULL where wineJarId=0;

alter table Card change  `wineJarId` `wineJarId` int(11) DEFAULT NULL;

delete from WineJar where id=0;
//version 2.0
alter table Winery change zipCode zipcode varchar(6) DEFAULT NULL;
alter table Winery change mobileNumber mobilePhone varchar(14) DEFAULT NULL;
alter table Winery change phone `telephone` varchar(15) DEFAULT NULL;
alter table Winery add `enterpriseCode` varchar(20) DEFAULT NULL;
alter table Winery add `enterpriseName` varchar(20) DEFAULT NULL;
alter table Winery add `enterpriseName1` varchar(20) DEFAULT NULL;
alter table Winery add `contact` varchar(16) DEFAULT NULL;
alter table Winery add `telephone1` varchar(15) DEFAULT NULL;
alter table Winery add `hygieneLicense` varchar(20) DEFAULT NULL;
alter table Winery add `businessLicence` varchar(20) DEFAULT NULL;
alter table Winery add `createDate` datetime DEFAULT NULL;
alter table Winery add `isConfirm` enum('N','Y','C') DEFAULT 'N';
alter table Winery add `introduction` text DEFAULT NULL;
alter table Winery add index `zipcode`(`zipcode`);
alter table Winery add index `mobilePhone`(`mobilePhone`);
alter table Winery add index `enterpriseCode`(`enterpriseCode`);
alter table Winery add index `enterpriseName`(`enterpriseName`);
alter table Winery add index `enterpriseName1`(`enterpriseName1`);
alter table Winery add index `contact`(`contact`);
alter table Winery add index `telephone`(`telephone`);
alter table Winery add index `telephone1`(`telephone1`);
alter table Winery add index `hygieneLicense`(`hygieneLicense`);
alter table Winery add index `businessLicence`(`businessLicence`);
alter table Winery add index `createDate`(`createDate`);

//version 2.1
alter table Winery drop enterpriseName;
alter table Winery change definition enterpriseName varchar(32) DEFAULT NULL;
alter table Winery change abbreviation shortName varchar(5) DEFAULT NULL;
alter table Winery change branchId branchId int(11) DEFAULT NULL;
//version 2.2
CREATE TABLE `WineStyle` (
  `id` int(11) NOT NULL DEFAULT '0',
  `enterpriseId` int(11) DEFAULT NULL,
  `styleNumber` varchar(20) DEFAULT NULL,
  `styleName` varchar(20) DEFAULT NULL,
  `alcohol` varchar(10) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `flavor` varchar(32) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterpriseId` (`enterpriseId`),
  KEY `styleNumber` (`styleNumber`),
  KEY `styleName` (`styleName`),
  KEY `alcohol` (`alcohol`),
  KEY `material` (`material`),
  KEY `flavor` (`flavor`),
  KEY `createDate` (`createDate`),
  CONSTRAINT `WineStyle_ibfk_1` FOREIGN KEY (`enterpriseId`) REFERENCES `Winery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BrewJob` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewNumber` varchar(20) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` decimal(5,2) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `jobState` enum('Create','Working','Finish','Cancel') DEFAULT NULL,
  `jobDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ubp` (`brewNumber`,`productId`),
  KEY `brewNumber` (`brewNumber`),
  KEY `productId` (`productId`),
  KEY `quantity` (`quantity`),
  KEY `jobDate` (`jobDate`),
  CONSTRAINT `BrewJob_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `WineStyle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
CREATE TABLE `Inspection` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewJobId` int(11) DEFAULT NULL,
  `productId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brewNumber` (`brewNumber`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
 CREATE TABLE `BrewCrafts` (
  `id` int(11) NOT NULL DEFAULT '0',
  `craftsName` varchar(32) DEFAULT NULL,
  `craftsDesc` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `craftsName` (`craftsName`),
  KEY `craftsDesc` (`craftsDesc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE `BrewPoint` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewCraftsId` int(11) DEFAULT NULL,
  `pointName` varchar(32) DEFAULT NULL,
  `pointDesc` varchar(64) DEFAULT NULL,
  `pointOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pointName` (`pointName`),
  KEY `pointDesc` (`pointDesc`),
  CONSTRAINT `BrewPoint_ibfk_1` FOREIGN KEY (`brewCraftsId`) REFERENCES `BrewCrafts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `BrewJobDetail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewJobId` int(11) DEFAULT NULL,
  `jobPointId` int(11) DEFAULT NULL,
  `jobDate` datetime DEFAULT NULL,
  `jobPeople` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brewJobId` (`brewJobId`),
  KEY `jobPointId` (`jobPointId`),
  KEY `jobDate` (`jobDate`),
  KEY `jobPeople` (`jobPeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Warehouse` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `batchNumber` varchar(20) DEFAULT NULL,
  `quantity` decimal(5,2) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `dcDate` datetime DEFAULT NULL,
  `dcPeople` varchar(32) DEFAULT NULL,
  `dcType` enum('Debit','Credit') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `batchNumber` (`batchNumber`),
  KEY `quantity` (`quantity`),
  KEY `dcDate` (`dcDate`),
  KEY `dcPeople` (`dcPeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Sale` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `batchNumber` varchar(20) DEFAULT NULL,
  `quantity` decimal(5,2) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `dcDate` datetime DEFAULT NULL,
  `dcPeople` varchar(32) DEFAULT NULL,
  `dcType` enum('Debit','Credit') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `batchNumber` (`batchNumber`),
  KEY `quantity` (`quantity`),
  KEY `dcDate` (`dcDate`),
  KEY `dcPeople` (`dcPeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `Barcode` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `codeNumber` varchar(13) DEFAULT NULL,
  `pointDate` datetime DEFAULT NULL,
  `point` enum('Create','Working','Finish','Cancel') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//version 2.3
use wineBranch;
drop table BrewPoint;
drop table BrewCrafts;

use wineShared;
 CREATE TABLE `BrewCrafts` (
  `id` int(11) NOT NULL DEFAULT '0',
  `craftsName` varchar(32) DEFAULT NULL,
  `craftsDesc` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `craftsName` (`craftsName`),
  KEY `craftsDesc` (`craftsDesc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE `BrewPoint` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewCraftsId` int(11) DEFAULT NULL,
  `pointName` varchar(32) DEFAULT NULL,
  `pointDesc` varchar(64) DEFAULT NULL,
  `pointOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pointName` (`pointName`),
  KEY `pointDesc` (`pointDesc`),
  CONSTRAINT `BrewPoint_ibfk_1` FOREIGN KEY (`brewCraftsId`) REFERENCES `BrewCrafts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
use wineBranch;
drop table BrewJobDetail;

CREATE TABLE `BrewJobDetail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `brewJobId` int(11) DEFAULT NULL,
  `jobPointId` int(11) DEFAULT NULL,
  `jobDate` datetime DEFAULT NULL,
  `jobPeople` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brewJobId` (`brewJobId`),
  KEY `jobPointId` (`jobPointId`),
  KEY `jobDate` (`jobDate`),
  KEY `jobPeople` (`jobPeople`),
  CONSTRAINT `BrewJobDetail_ibfk_1` FOREIGN KEY (`brewJobId`) REFERENCES `BrewJob` (`id`),
  CONSTRAINT `BrewJobDetail_ibfk_2` FOREIGN KEY (`jobPointId`) REFERENCES `wineShared`.`BrewPoint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS = 0;

//version 2.4
alter table WineJar add `perimeter` decimal(5,3) DEFAULT NULL;
alter table WineJar add index `perimeter`(`perimeter`);
alter table WineJar add `totalHeight` decimal(5,3) DEFAULT NULL;
alter table WineJar add index `totalHeight`(`totalHeight`);
alter table WineJar add `clearHeight` decimal(5,3) DEFAULT NULL;
alter table WineJar add index `clearHeight`(`clearHeight`);
alter table WineJar add `density` decimal(5,3) DEFAULT NULL;
alter table WineJar add index `density`(`density`);
alter table WineJar add `weight` decimal(9,3) DEFAULT NULL;
alter table WineJar add index `weight`(`weight`);
alter table WineJar change volume `volume` decimal(9,3) DEFAULT NULL;

//version 2.5
alter table WineJar add `outsideHeight` decimal(5,3) DEFAULT NULL;
alter table WineJar add index `outsideHeight`(`outsideHeight`);

//version 2.6
alter table Winery add `website` varchar(30) DEFAULT NULL;
alter table Winery add index `website`(`website`);

alter table Winery add `totalPits` varchar(30) DEFAULT NULL;
alter table Winery add `averageAgePits` varchar(30) DEFAULT NULL;
alter table Winery add `hightAgePits` varchar(30) DEFAULT NULL;
alter table Winery add `nissan` varchar(30) DEFAULT NULL;
alter table Winery add `nissanTop` varchar(30) DEFAULT NULL;

 drop table Product;
 drop table ProductType;
 drop table ProductCategory;
 drop table Sale;
 drop table Warehouse;
 drop table Barcode;
 
//version 2.7

CREATE TABLE `Product` (
 `id` int(11) NOT NULL DEFAULT '0',
 `enterpriseId` int(11) DEFAULT NULL,
 `styleNumber` varchar(20) DEFAULT NULL,
 `styleName` varchar(20) DEFAULT NULL,
 `alcohol` varchar(10) DEFAULT NULL,
 `material` varchar(32) DEFAULT NULL,
 `flavor` varchar(32) DEFAULT NULL,
 volume int(11) DEFAULT NULL,
 `production` varchar(50) DEFAULT NULL,
`fermentDays` varchar(50) DEFAULT NULL,
`createDate` date DEFAULT NULL,
`description` varchar(64) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `enterpriseId` (`enterpriseId`),
 KEY `styleNumber` (`styleNumber`),
 KEY `styleName` (`styleName`),
 KEY `alcohol` (`alcohol`),
 KEY `material` (`material`),
 KEY `flavor` (`flavor`),
 KEY `volume` (`volume`),
 KEY `production` (`production`),
 KEY `fermentDays` (`fermentDays`),
 KEY `createDate` (`createDate`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`enterpriseId`) REFERENCES `Winery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Warehouse` (
  `id` int(11) NOT NULL DEFAULT '0',
  `enterpriseId` int(11) DEFAULT NULL,
  `warehouseName` varchar(20) DEFAULT NULL,
  `contact` varchar(16) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `zipcode` varchar(6) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterpriseId` (`enterpriseId`),
  KEY `warehouseName` (`warehouseName`),
  KEY `contact` (`contact`),
  KEY `address` (`address`),
  KEY `zipcode` (`zipcode`),
  KEY `telephone` (`telephone`),
  CONSTRAINT `Warehouse_ibfk_1` FOREIGN KEY (`enterpriseId`) REFERENCES `Winery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `StorageAccount` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `warehouseId` int(11) DEFAULT NULL,
  `batchNumber` varchar(20) DEFAULT NULL,
  `storageDate` datetime DEFAULT NULL,
  `storagePeople` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `warehouseId` (`warehouseId`),
  KEY `batchNumber` (`batchNumber`),
  KEY `storageDate` (`storageDate`),
  KEY `storagePeople` (`storagePeople`),
  CONSTRAINT `StorageAccount_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`),
  CONSTRAINT `StorageAccount_ibfk_2` FOREIGN KEY (`warehouseId`) REFERENCES `Warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `StorageDetail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `itemId` int(11) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `itemName` varchar(16) DEFAULT NULL,
  `quanItem` decimal(5,2) DEFAULT NULL,
  `itemVol` decimal(5,2) DEFAULT NULL,
  `volUnit` varchar(6) DEFAULT NULL,
  `storageType` enum('Debit','Credit') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemId` (`itemId`),
  KEY `accountId` (`accountId`),
  KEY `itemName` (`itemName`),
  KEY `quanItem` (`quanItem`),
  KEY `itemVol` (`itemVol`),
  CONSTRAINT `StorageDetail_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `wineShared`.`WarehouseItem` (`id`),
  CONSTRAINT `StorageDetail_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `StorageAccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `StorageTasting` (
  `id` int(11) NOT NULL DEFAULT '0',
  `accountId` int(11) DEFAULT NULL,
  `sommelier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  KEY `sommelier` (`sommelier`),
  CONSTRAINT `StorageTasting_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `StorageAccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SampleProduct` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  `sampleName` varchar(20) DEFAULT NULL,
  `buildDate` datetime DEFAULT NULL,
  `buildPeople` varchar(32) DEFAULT NULL,
  `isPost` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `sampleName` (`sampleName`),
  KEY `buildDate` (`buildDate`),
  KEY `buildPeople` (`buildPeople`),
  CONSTRAINT `ProductSample_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SampleItem` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sampleId` int(11) DEFAULT NULL,
  `itemName` varchar(20) DEFAULT NULL,
  `itemAge` varchar(20) DEFAULT NULL,
  `itemVolume` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampleId` (`sampleId`),
  KEY `itemName` (`itemName`),
  KEY `itemAge` (`itemAge`),
  KEY `itemVolume` (`itemVolume`),
  CONSTRAINT `SampleItem_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `SampleProduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SampleTasting` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sampleId` int(11) DEFAULT NULL,
  `sommelier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampleId` (`sampleId`),
  KEY `sommelier` (`sommelier`),
  CONSTRAINT `SampleTasting_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `SampleProduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Inspection` (
  `id` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) DEFAULT NULL,
  `inspectionPerson` varchar(32) DEFAULT NULL,
  `routineTest` varchar(5) DEFAULT NULL,
  `plasticizerTest` varchar(5) DEFAULT NULL,
  `standard` varchar(32) DEFAULT NULL,
  `inspectionNo` varchar(32) DEFAULT NULL,
  `inspectionPoint` enum('Canned','OnSale') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  CONSTRAINT `Inspection_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Sale` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sampleId` int(11) DEFAULT NULL,
  `batchNo` varchar(20) DEFAULT NULL,
  `saleDate` datetime DEFAULT NULL,
  `isSale` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampleId` (`sampleId`),
  KEY `batchNo` (`batchNo`),
  KEY `saleDate` (`saleDate`),
  CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `SampleProduct` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SaleItem` (
  `id` int(11) NOT NULL DEFAULT '0',
  `saleId` int(11) DEFAULT NULL,
  `salePrice` decimal(5,2) DEFAULT NULL,
  `saleCurr` char(4) DEFAULT NULL,
  `saleVol` int(11) DEFAULT NULL,
  `volUnit` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `saleId` (`saleId`),
  KEY `salePrice` (`salePrice`),
  KEY `saleVol` (`saleVol`),
  CONSTRAINT `SaleItem_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `Sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//jobBy U Up Q Query D Down
CREATE TABLE `SaleJob` (
  `id` int(11) NOT NULL DEFAULT '0',
  `saleCode` varchar(13) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `jobDate` datetime DEFAULT NULL,
  `jobBy` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `saleCode` (`saleCode`),
  KEY `itemId` (`itemId`),
  KEY `jobDate` (`jobDate`),
  CONSTRAINT `SaleJob_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `SaleItem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


//version 2.3

alter table Winery change  `totalPits` `totalPits` decimal(5,2) DEFAULT NULL;
alter table Winery change  `averageAgePits` `averageAgePits` decimal(5,2) DEFAULT NULL;
alter table Winery change  `hightAgePits` `hightAgePits` decimal(5,2) DEFAULT NULL;
alter table Winery change  `nissan` `nissan` decimal(5,2) DEFAULT NULL;
alter table Winery change  `nissanTop` `nissanTop` decimal(5,2) DEFAULT NULL;

alter table Winery add index `totalPits`(`totalPits`);
alter table Winery add index `averageAgePits`(`averageAgePits`);
alter table Winery add index `hightAgePits`(`hightAgePits`);
alter table Winery add index `nissan`(`nissan`);
alter table Winery add index `nissanTop`(`nissanTop`);

alter table Product change  `styleNumber` `productCode` varchar(5) DEFAULT NULL;
alter table Product change  `styleName` `productName` varchar(16) DEFAULT NULL;
alter table Product drop index `styleNumber`;
alter table Product add index `productCode`(`productCode`);
alter table Product drop index `styleName`;
alter table Product add index `productName`(`productName`);

alter table Product change  `alcohol` `alcohol` decimal(4,2) DEFAULT NULL;
alter table Product change  `flavor` `flavor` varchar(6) DEFAULT NULL;
alter table Product change  `fermentDays` `fermentDays` int(11) DEFAULT NULL;
alter table Product change  `volume` `netContent` int(11) DEFAULT NULL;

alter table Warehouse change  `address` `address` varchar(32) DEFAULT NULL;

use wineShared;
CREATE TABLE `WarehouseItem` (
  `id` int(11) NOT NULL DEFAULT '0',
  `itemName` varchar(32) DEFAULT NULL,
  `usefulLife` int(11) DEFAULT NULL,
  `storageMode` varchar(16) DEFAULT NULL,
  `itemVolume` int(11) DEFAULT NULL,
  `volUtil` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemName` (`itemName`),
  KEY `usefulLife` (`usefulLife`),
  KEY `itemVolume` (`itemVolume`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table StorageDetail change  `itemName` `storageName` varchar(16) DEFAULT NULL;
alter table StorageDetail drop index `itemName`;
alter table StorageDetail add index  `storageName` (`storageName`);

alter table SaleJob change  `saleCode` `saleCode` varchar(16) DEFAULT NULL;

alter table Sale add  `saleScore` decimal(5,2) DEFAULT NULL;

alter table Sale drop  `saleScore`;
alter table SampleProduct add  `expertScore` decimal(5,2) DEFAULT NULL;

alter table SampleItem change  `itemVolume` `itemVol` decimal(5,2) DEFAULT NULL;
alter table SampleItem change  `itemAge` `itemAge` varchar(3) DEFAULT NULL;
alter table SampleItem add  `itemVolUnit` char(4) DEFAULT NULL;

alter table SaleJob change  `saleCode` `saleCode` varchar(20) DEFAULT NULL;

//2.4
alter table Sale drop FOREIGN KEY `Sale_ibfk_1`;
alter table Sale drop `sampleId`;
alter table SaleItem add  `sampleId` int(11) DEFAULT NULL;
alter table SaleItem add  index  `sampleId` (`sampleId`);
alter table SaleItem add CONSTRAINT `SaleItem_ibfk_2` FOREIGN KEY (`sampleId`) REFERENCES `SampleProduct` (`id`);
//2.5
alter table Product drop  index  `productName`;
alter table Product drop  index  `productCode`;
alter table Product add  UNIQUE index  `productCode` (`productCode`);
alter table Product add  UNIQUE index  `productName` (`productName`);

alter table Winery change  `totalPits` `totalPits` int(11) DEFAULT NULL;
alter table Winery change  `hightAgePits` `hightAgePits` int(11) DEFAULT NULL;

//2.6
alter table SampleProduct add  `tastingStartTime` datetime DEFAULT NULL;
alter table SampleProduct add  `tastingEndTime` datetime DEFAULT NULL;
alter table SampleProduct add  `tastingSite` varchar(20) DEFAULT NULL;
alter table SampleProduct add  `drunkLevel` decimal(5,2) DEFAULT NULL;
alter table SampleProduct add  `tastingComment` text DEFAULT NULL;

alter table SampleProduct add  index  `tastingStartTime` (`tastingStartTime`);
alter table SampleProduct add  index  `tastingEndTime` (`tastingEndTime`);
alter table SampleProduct add  index  `tastingSite` (`tastingSite`);
alter table SampleProduct add  index  `drunkLevel` (`drunkLevel`);

CREATE TABLE `WineTaster` (
  `id` int(11) NOT NULL DEFAULT '0',
  `tasterName` varchar(16) DEFAULT NULL,
  `tasterLicense` varchar(64) DEFAULT NULL,
  `tasterCategory` enum('Expert','Profession') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasterName` (`tasterName`),
  KEY `tasterLicense` (`tasterLicense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table SampleTasting change  `sommelier` `tasterId` int(11) DEFAULT NULL;

alter table SampleTasting add CONSTRAINT `SampleTasting_ibfk_2` FOREIGN KEY (`tasterId`) REFERENCES `wineShared`.`WineTaster` (`id`);

alter table SaleItem change  `salePrice` `salePrice` decimal(7,2) DEFAULT NULL;


alter table WineJar change  `jarNumber` `jarNumber` varchar(5) DEFAULT NULL;

SELECT cardJob.id,cardJob.jobDate,user.name,jobType.definition,wineJar.jarNumber,count(cardJob.id) 
FROM wineShared.JobType jobType,wineBranch.WineJar wineJar,wineBranch.CardJob cardJob,
wineBranch.Card card,wineBranch.User user,wineBranch.Winery winery
WHERE wineJar.wineryId=winery.id AND wineJar.branchId=winery.branchId 
AND card.wineJarId=wineJar.id AND card.branchId=wineJar.branchId AND
cardJob.cardId=card.id AND cardJob.branchId=card.branchId AND
cardJob.userId=user.id AND cardJob.branchId=user.branchId AND 
cardJob.jobTypeId=jobType.id AND card.branchId=4 
AND cardJob.jobTypeId=3 
GROUP BY DATE_FORMAT( cardJob.jobDate, "%Y-%m-%d"),winery.id,wineJar.jarNumber,card.id

SELECT cardJob.id,cardJob.jobDate,user.name,jobType.definition,wineJar.jarNumber,count(cardJob.id) 
FROM wineShared.JobType jobType,wineBranch.WineJar wineJar,wineBranch.CardJob cardJob,
wineBranch.Card card,wineBranch.User user,wineBranch.Winery winery
WHERE wineJar.wineryId=winery.id AND wineJar.branchId=winery.branchId 
AND card.wineJarId=wineJar.id AND card.branchId=wineJar.branchId AND
cardJob.cardId=card.id AND cardJob.branchId=card.branchId AND
cardJob.userId=user.id AND cardJob.branchId=user.branchId AND 
cardJob.jobTypeId=jobType.id AND card.branchId=4 
AND cardJob.jobTypeId=3 
GROUP BY DATE_FORMAT( cardJob.jobDate, "%Y-%m-%d"),winery.id,wineJar.jarNumber,card.id

select * from CardJob GROUP BY DATE_FORMAT( cardJob.jobDate, "%Y-%m-%d");

alter table Card change  `position` `position` varchar(2) DEFAULT NULL;
update Card set position='D1' where position='1';
update Card set position='上' where position='5';
update Card set position='下' where position='6';
update Card set position='左' where position='7';
update Card set position='右' where position='8';
update Card set position='中' where position='9';

alter table Card add  `remark` varchar(64) DEFAULT NULL;

alter table WineJar change jarNumber jarNumber varchar(16) DEFAULT NULL;
