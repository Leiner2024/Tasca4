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
-- Table `mydb`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumno` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura` (
  `ID` INT NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `Profesor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `ID` VARCHAR(45) NOT NULL,
  `Curso` VARCHAR(45) NOT NULL,
  `Grupo` VARCHAR(45) NOT NULL,
  `Data` INT NOT NULL,
  `Asignatura` VARCHAR(45) NOT NULL,
  `Alumno_ID` INT NOT NULL,
  INDEX `fk_Matricula_Alumno_idx` (`Alumno_ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Matricula_Alumno`
    FOREIGN KEY (`Alumno_ID`)
    REFERENCES `mydb`.`Alumno` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `NIF` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Titulacion` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `EsCapDepartament` VARCHAR(45) NULL,
  `Departamento_Nom` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Profesor_Departamento1_idx` (`Departamento_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_Departamento1`
    FOREIGN KEY (`Departamento_Nom`)
    REFERENCES `mydb`.`Departamento` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asignatura_Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asignatura_Matricula` (
  `ID` INT NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  `Profesor` VARCHAR(45) NOT NULL,
  `Matricula_Alumno` VARCHAR(45) NOT NULL,
  `Asignatura_Nom` INT NOT NULL,
  `Profesor_DNI` INT NOT NULL,
  `Matricula_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Asignatura_Matricula_Asignatura1_idx` (`Asignatura_Nom` ASC) VISIBLE,
  INDEX `fk_Asignatura_Matricula_Profesor1_idx` (`Profesor_DNI` ASC) VISIBLE,
  INDEX `fk_Asignatura_Matricula_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Asignatura_Matricula_Asignatura1`
    FOREIGN KEY (`Asignatura_Nom`)
    REFERENCES `mydb`.`Asignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignatura_Matricula_Profesor1`
    FOREIGN KEY (`Profesor_DNI`)
    REFERENCES `mydb`.`Profesor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignatura_Matricula_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `mydb`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
