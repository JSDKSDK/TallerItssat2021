DROP DATABASE hospitales;
CREATE DATABASE hospitales;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospitales
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospitales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitales` DEFAULT CHARACTER SET utf8mb4 ;
USE `hospitales` ;

-- -----------------------------------------------------
-- Table `hospitales`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`areas` (
  `FIIDAREA` INT(50) NOT NULL AUTO_INCREMENT,
  `NOMBRE_AREA` VARCHAR(255) NOT NULL,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `FECHA_REGISTRO` DATE NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(50) NOT NULL,
  PRIMARY KEY (`FIIDAREA`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`consultorio` (
  `FIIDCONSULTORIO` INT(50) NOT NULL AUTO_INCREMENT,
  `NUMERO_CONSULTORIO` INT(50) NOT NULL,
  `NOMBRE_CONSULTORIO` VARCHAR(50) NOT NULL,
  `FIIDAREA` INT(50) NOT NULL,
  `FECHA_REGISTRO` DATE NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(50) NOT NULL,
  PRIMARY KEY (`FIIDCONSULTORIO`),
  INDEX `FKConsultori501020` (`FIIDAREA` ASC) VISIBLE,
  CONSTRAINT `FKConsultori501020`
    FOREIGN KEY (`FIIDAREA`)
    REFERENCES `hospitales`.`areas` (`FIIDAREA`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`especialidades` (
  `FIIDESPECIALIDAD` INT(50) NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(50) NOT NULL,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `FECHA_REGISTRO` DATE NOT NULL,
  `ULTIMA_ACTUALIZACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(50) NOT NULL,
  PRIMARY KEY (`FIIDESPECIALIDAD`),
  INDEX `Especialidades` (`FIIDESPECIALIDAD` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`doctores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`doctores` (
  `FIIDDOCTOR` INT(50) NOT NULL AUTO_INCREMENT,
  `NOMBREDOCTOR` VARCHAR(255) NOT NULL,
  `FIIDESPECIALIDAD` INT(50) NOT NULL,
  `CEDULA` VARCHAR(255) NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `USUARIO_MODIFICO` INT(10) NOT NULL,
  PRIMARY KEY (`FIIDDOCTOR`),
  UNIQUE INDEX `NOMBREDOCTOR` (`NOMBREDOCTOR` ASC) VISIBLE,
  UNIQUE INDEX `CEDULA` (`CEDULA` ASC) VISIBLE,
  INDEX `Doctores` (`FIIDDOCTOR` ASC) VISIBLE,
  INDEX `FKDoctores109718` (`FIIDESPECIALIDAD` ASC) VISIBLE,
  CONSTRAINT `FKDoctores109718`
    FOREIGN KEY (`FIIDESPECIALIDAD`)
    REFERENCES `hospitales`.`especialidades` (`FIIDESPECIALIDAD`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`doctores_consultorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`doctores_consultorios` (
  `FIIDDOCTOR` INT(50) NOT NULL,
  `FIIDCONSULTORIO` INT(50) NOT NULL,
  INDEX `FKDoctores_C691401` (`FIIDDOCTOR` ASC) VISIBLE,
  INDEX `FKDoctores_C55729` (`FIIDCONSULTORIO` ASC) VISIBLE,
  CONSTRAINT `FKDoctores_C55729`
    FOREIGN KEY (`FIIDCONSULTORIO`)
    REFERENCES `hospitales`.`consultorio` (`FIIDCONSULTORIO`),
  CONSTRAINT `FKDoctores_C691401`
    FOREIGN KEY (`FIIDDOCTOR`)
    REFERENCES `hospitales`.`doctores` (`FIIDDOCTOR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`enfermeros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`enfermeros` (
  `FIIDENFERMERO` INT(50) NOT NULL AUTO_INCREMENT,
  `NUMEROEMPLEADO` VARCHAR(50) NOT NULL,
  `NOMBREENFERMERO` VARCHAR(255) NOT NULL,
  `FIIDAREA` INT(50) NOT NULL,
  `HORARIO` VARCHAR(50) NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(50) NOT NULL,
  PRIMARY KEY (`FIIDENFERMERO`),
  UNIQUE INDEX `NUMEROEMPLEADO` (`NUMEROEMPLEADO` ASC) VISIBLE,
  UNIQUE INDEX `NOMBREENFERMERO` (`NOMBREENFERMERO` ASC) VISIBLE,
  INDEX `FKEnfermeros54472` (`FIIDAREA` ASC) VISIBLE,
  CONSTRAINT `FKEnfermeros54472`
    FOREIGN KEY (`FIIDAREA`)
    REFERENCES `hospitales`.`areas` (`FIIDAREA`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`pacientes` (
  `FIIDPACIENTE` INT(50) NOT NULL AUTO_INCREMENT,
  `NOMBREPACIENTE` VARCHAR(255) NOT NULL,
  `NUMERO_SEGURO` INT(10) NOT NULL,
  `EDAD` INT(10) NOT NULL,
  `GENERO` VARCHAR(50) NOT NULL,
  `NUMERO_EXPEDIENTE` INT(50) NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(10) NOT NULL,
  PRIMARY KEY (`FIIDPACIENTE`),
  INDEX `Pacientes` (`FIIDPACIENTE` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`receta` (
  `FIIDRECETA` INT(50) NOT NULL AUTO_INCREMENT,
  `FOLIORECETA` VARCHAR(255) NOT NULL,
  `MEDICAMENTOS` VARCHAR(255) NOT NULL,
  `INSTRUCCIONES` VARCHAR(500) NOT NULL,
  `FECHA_REGISTRO` DATE NOT NULL,
  PRIMARY KEY (`FIIDRECETA`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`receta_paciente_doctores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`receta_paciente_doctores` (
  `FIIDDOCTOR` INT(50) NOT NULL,
  `FIIDPACIENTE` INT(50) NOT NULL,
  `FIIDRECETA` INT(50) NOT NULL,
  INDEX `FKReceta_Pac815481` (`FIIDPACIENTE` ASC) VISIBLE,
  INDEX `FKReceta_Pac973732` (`FIIDDOCTOR` ASC) VISIBLE,
  INDEX `FKReceta_Pac475497` (`FIIDRECETA` ASC) VISIBLE,
  CONSTRAINT `FKReceta_Pac475497`
    FOREIGN KEY (`FIIDRECETA`)
    REFERENCES `hospitales`.`receta` (`FIIDRECETA`),
  CONSTRAINT `FKReceta_Pac815481`
    FOREIGN KEY (`FIIDPACIENTE`)
    REFERENCES `hospitales`.`pacientes` (`FIIDPACIENTE`),
  CONSTRAINT `FKReceta_Pac973732`
    FOREIGN KEY (`FIIDDOCTOR`)
    REFERENCES `hospitales`.`doctores` (`FIIDDOCTOR`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `hospitales`.`usuario_sistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitales`.`usuario_sistema` (
  `FIIDUSUARIO_SISTEMA` INT(50) NOT NULL AUTO_INCREMENT,
  `NOMBRE_USUARIO` VARCHAR(50) NOT NULL,
  `NUMERO_USUARIO` INT(50) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `HABILITADO` BIT(1) NOT NULL,
  `ULTIMA_MODIFICACION` DATE NOT NULL,
  `USUARIO_MODIFICO` INT(50) NOT NULL,
  PRIMARY KEY (`FIIDUSUARIO_SISTEMA`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
