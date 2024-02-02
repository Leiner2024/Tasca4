-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Cine` (
  `NIF` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `N_Sales` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Poblacion` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Pelis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Pelis` (
  `ISBN` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor_Secundario` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Proyecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Proyecciones` (
  `ID` INT NOT NULL,
  `Hora_de_Inicio` TIME NULL,
  `Hora_final` TIME NULL,
  `Pelicula_ISBN` VARCHAR(45) NULL,
  `Tarifa_ID` VARCHAR(45) NULL,
  `Cine_NIF` VARCHAR(45) NULL,
  `Cine_NIF1` INT NOT NULL,
  `Pelis_ISBN` INT NOT NULL,
  `Tarifa_ID1` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Proyecciones_Cine_idx` (`Cine_NIF1` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Pelis1_idx` (`Pelis_ISBN` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Tarifa1_idx` (`Tarifa_ID1` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecciones_Cine`
    FOREIGN KEY (`Cine_NIF1`)
    REFERENCES `MER2B`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Pelis1`
    FOREIGN KEY (`Pelis_ISBN`)
    REFERENCES `MER2B`.`Pelis` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Tarifa1`
    FOREIGN KEY (`Tarifa_ID1`)
    REFERENCES `MER2B`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Proyecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Proyecciones` (
  `ID` INT NOT NULL,
  `Hora_de_Inicio` TIME NULL,
  `Hora_final` TIME NULL,
  `Pelicula_ISBN` VARCHAR(45) NULL,
  `Tarifa_ID` VARCHAR(45) NULL,
  `Cine_NIF` VARCHAR(45) NULL,
  `Cine_NIF1` INT NOT NULL,
  `Pelis_ISBN` INT NOT NULL,
  `Tarifa_ID1` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Proyecciones_Cine_idx` (`Cine_NIF1` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Pelis1_idx` (`Pelis_ISBN` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Tarifa1_idx` (`Tarifa_ID1` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecciones_Cine`
    FOREIGN KEY (`Cine_NIF1`)
    REFERENCES `MER2B`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Pelis1`
    FOREIGN KEY (`Pelis_ISBN`)
    REFERENCES `MER2B`.`Pelis` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Tarifa1`
    FOREIGN KEY (`Tarifa_ID1`)
    REFERENCES `MER2B`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
