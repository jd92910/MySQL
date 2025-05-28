-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`company` ;

CREATE TABLE IF NOT EXISTS `mydb`.`company` (
  `idCompany` INT NOT NULL,
  `CompanyName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCompany`),
  UNIQUE INDEX `CompanyName_UNIQUE` (`CompanyName` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trainType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`trainType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`trainType` (
  `idtrainType` INT NOT NULL,
  `trainType` VARCHAR(45) NULL,
  PRIMARY KEY (`idtrainType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`train` ;

CREATE TABLE IF NOT EXISTS `mydb`.`train` (
  `idtrain` INT NOT NULL,
  `trainName` VARCHAR(45) NULL,
  `Company_idCompany` INT NOT NULL,
  `trainType_idtrainType` INT NOT NULL,
  `trainStatus_idtrainStatus` INT NOT NULL,
  PRIMARY KEY (`idtrain`),
  INDEX `fk_train_Company1_idx` (`Company_idCompany` ASC) ,
  INDEX `fk_train_trainType1_idx` (`trainType_idtrainType` ASC) ,
  CONSTRAINT `fk_train_Company1`
    FOREIGN KEY (`Company_idCompany`)
    REFERENCES `mydb`.`company` (`idCompany`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_trainType1`
    FOREIGN KEY (`trainType_idtrainType`)
    REFERENCES `mydb`.`trainType` (`idtrainType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seats avaliability`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Seats avaliability` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Seats avaliability` (
  `idSeats avaliability` INT NOT NULL,
  `seatsAvaliabilitystatus` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idSeats avaliability`),
  UNIQUE INDEX `seatsAvaliabilitystatus_UNIQUE` (`seatsAvaliabilitystatus` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`raid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`raid` ;

CREATE TABLE IF NOT EXISTS `mydb`.`raid` (
  `idRaid` INT NOT NULL,
  `train_idtrain` INT NOT NULL,
  `raidDateTimeStrat` DATETIME NOT NULL,
  `dealy` DATETIME NOT NULL,
  `raidDateTimeEnd` DATETIME NOT NULL,
  `Seats avaliability_idSeats avaliability` INT NOT NULL,
  PRIMARY KEY (`idRaid`),
  INDEX `fk_raid_train1_idx` (`train_idtrain` ASC) ,
  INDEX `fk_raid_Seats avaliability1_idx` (`Seats avaliability_idSeats avaliability` ASC) ,
  CONSTRAINT `fk_raid_train1`
    FOREIGN KEY (`train_idtrain`)
    REFERENCES `mydb`.`train` (`idtrain`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_raid_Seats avaliability1`
    FOREIGN KEY (`Seats avaliability_idSeats avaliability`)
    REFERENCES `mydb`.`Seats avaliability` (`idSeats avaliability`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`city` ;

CREATE TABLE IF NOT EXISTS `mydb`.`city` (
  `idcity` INT NOT NULL,
  `cityName` VARCHAR(45) NOT NULL,
  `zipCode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idcity`),
  UNIQUE INDEX `zipCode_UNIQUE` (`zipCode` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`station` ;

CREATE TABLE IF NOT EXISTS `mydb`.`station` (
  `idStation` INT NOT NULL,
  `stationName` VARCHAR(45) NULL,
  `city_idcity` INT NOT NULL,
  PRIMARY KEY (`idStation`),
  INDEX `fk_station_city1_idx` (`city_idcity` ASC) ,
  CONSTRAINT `fk_station_city1`
    FOREIGN KEY (`city_idcity`)
    REFERENCES `mydb`.`city` (`idcity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`route` ;

CREATE TABLE IF NOT EXISTS `mydb`.`route` (
  `idroute` INT NOT NULL,
  `ride_idride` INT NOT NULL,
  `direction` TINYINT NOT NULL,
  `startstop` VARCHAR(45) NOT NULL,
  `endstop` VARCHAR(45) NOT NULL,
  INDEX `fk_route_Przejazd1_idx` (`ride_idride` ASC) ,
  PRIMARY KEY (`idroute`),
  CONSTRAINT `fk_route_Przejazd1`
    FOREIGN KEY (`ride_idride`)
    REFERENCES `mydb`.`raid` (`idRaid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`platform` ;

CREATE TABLE IF NOT EXISTS `mydb`.`platform` (
  `idplatform` INT NOT NULL,
  `platformNr` INT NOT NULL,
  `Station_idStation` INT NOT NULL,
  PRIMARY KEY (`idplatform`),
  UNIQUE INDEX `platformNr_UNIQUE` (`platformNr` ASC) ,
  INDEX `fk_platform_Station1_idx` (`Station_idStation` ASC) ,
  CONSTRAINT `fk_platform_Station1`
    FOREIGN KEY (`Station_idStation`)
    REFERENCES `mydb`.`station` (`idStation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`track`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`track` ;

CREATE TABLE IF NOT EXISTS `mydb`.`track` (
  `idtrack` INT NOT NULL,
  `trackNr` INT NOT NULL,
  `trackStatus` VARCHAR(45) NOT NULL,
  `platform_idplatform` INT NOT NULL,
  PRIMARY KEY (`idtrack`),
  INDEX `fk_track_platform1_idx` (`platform_idplatform` ASC) ,
  CONSTRAINT `fk_track_platform1`
    FOREIGN KEY (`platform_idplatform`)
    REFERENCES `mydb`.`platform` (`idplatform`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`stop` ;

CREATE TABLE IF NOT EXISTS `mydb`.`stop` (
  `idstop` INT NOT NULL,
  `arivalTime` DATETIME NOT NULL,
  `departureTime` DATETIME NOT NULL,
  `stopNr` INT NOT NULL,
  `Station_idStation` INT NOT NULL,
  `track_idtrack` INT NOT NULL,
  PRIMARY KEY (`idstop`),
  INDEX `fk_stop_Station1_idx` (`Station_idStation` ASC) ,
  INDEX `fk_stop_track1_idx` (`track_idtrack` ASC) ,
  UNIQUE INDEX `stopNr_UNIQUE` (`stopNr` ASC) ,
  CONSTRAINT `fk_stop_Station1`
    FOREIGN KEY (`Station_idStation`)
    REFERENCES `mydb`.`station` (`idStation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stop_track1`
    FOREIGN KEY (`track_idtrack`)
    REFERENCES `mydb`.`track` (`idtrack`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cart` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cart` (
  `idcart` INT NOT NULL,
  `train_idtrain` INT NOT NULL,
  PRIMARY KEY (`idcart`),
  INDEX `fk_cart_train1_idx` (`train_idtrain` ASC) ,
  CONSTRAINT `fk_cart_train1`
    FOREIGN KEY (`train_idtrain`)
    REFERENCES `mydb`.`train` (`idtrain`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cartType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cartType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cartType` (
  `idcartType` INT NOT NULL,
  `cartType` VARCHAR(45) NOT NULL,
  `seatAmount` INT NULL COMMENT '\n',
  PRIMARY KEY (`idcartType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart_has_cartType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cart_has_cartType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cart_has_cartType` (
  `cart_idcart` INT NOT NULL,
  `cartType_idcartType` INT NOT NULL,
  PRIMARY KEY (`cart_idcart`, `cartType_idcartType`),
  INDEX `fk_cart_has_cartType_cartType1_idx` (`cartType_idcartType` ASC) ,
  INDEX `fk_cart_has_cartType_cart1_idx` (`cart_idcart` ASC) ,
  CONSTRAINT `fk_cart_has_cartType_cart1`
    FOREIGN KEY (`cart_idcart`)
    REFERENCES `mydb`.`cart` (`idcart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_has_cartType_cartType1`
    FOREIGN KEY (`cartType_idcartType`)
    REFERENCES `mydb`.`cartType` (`idcartType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`route_has_stop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`route_has_stop` ;

CREATE TABLE IF NOT EXISTS `mydb`.`route_has_stop` (
  `route_idroute` INT NOT NULL,
  `stop_idstop` INT NOT NULL,
  PRIMARY KEY (`route_idroute`, `stop_idstop`),
  INDEX `fk_route_has_stop_stop1_idx` (`stop_idstop` ASC) ,
  INDEX `fk_route_has_stop_route1_idx` (`route_idroute` ASC) ,
  CONSTRAINT `fk_route_has_stop_route1`
    FOREIGN KEY (`route_idroute`)
    REFERENCES `mydb`.`route` (`idroute`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_route_has_stop_stop1`
    FOREIGN KEY (`stop_idstop`)
    REFERENCES `mydb`.`stop` (`idstop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
