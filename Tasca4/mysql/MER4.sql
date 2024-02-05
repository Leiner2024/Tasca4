-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Cliente` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Tipos_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipos_Polissa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Venedor` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `Num_Polissa` INT NOT NULL,
  `Precio_anual` VARCHAR(45) NULL,
  `Tipos_de_Pago` VARCHAR(45) NULL,
  `Data_contractacio` VARCHAR(45) NULL,
  `Cliente_DNI` INT NOT NULL,
  `Tipos_Polissa_ID` INT NOT NULL,
  `Venedor_DNI` INT NOT NULL,
  PRIMARY KEY (`Num_Polissa`),
  INDEX `fk_Polissa_Cliente_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipos_Polissa1_idx` (`Tipos_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Cliente`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `MER4`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipos_Polissa1`
    FOREIGN KEY (`Tipos_Polissa_ID`)
    REFERENCES `MER4`.`Tipos_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `MER4`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
