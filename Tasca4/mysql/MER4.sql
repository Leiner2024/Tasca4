-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipos_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipos_Polissa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venedor` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Polissa` (
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
    REFERENCES `mydb`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipos_Polissa1`
    FOREIGN KEY (`Tipos_Polissa_ID`)
    REFERENCES `mydb`.`Tipos_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `mydb`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
