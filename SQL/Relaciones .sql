-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fenixclub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fenixclub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fenixclub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `fenixclub` ;

-- -----------------------------------------------------
-- Table `fenixclub`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fenixclub`.`clasificacion` (
  `Posición` TEXT NULL DEFAULT NULL,
  `Equipo` TEXT NULL DEFAULT NULL,
  `PJ` TEXT NULL DEFAULT NULL,
  `G` TEXT NULL DEFAULT NULL,
  `P` TEXT NULL DEFAULT NULL,
  `PTS` TEXT NULL DEFAULT NULL,
  `id_equipo` INT NOT NULL,
  PRIMARY KEY (`id_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fenixclub`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fenixclub`.`historico` (
  `Equipo` TEXT NULL DEFAULT NULL,
  `Títulos` BIGINT NULL DEFAULT NULL,
  `Subcampeonatos` BIGINT NULL DEFAULT NULL,
  `Años` TEXT NULL DEFAULT NULL,
  `id_equipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fenixclub`.`jornadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fenixclub`.`jornadas` (
  `fecha` TEXT NULL DEFAULT NULL,
  `hora` TEXT NULL DEFAULT NULL,
  `enfrentamiento` TEXT NULL DEFAULT NULL,
  `id_equipo_local` VARCHAR(45) NOT NULL,
  `id_equipo_visitante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipo_local`, `id_equipo_visitante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fenixclub`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fenixclub`.`equipos` (
  `Equipo` TEXT NULL DEFAULT NULL,
  `id_equipo` INT NOT NULL,
  `historico_id_equipo` VARCHAR(45) NOT NULL,
  `clasificacion_id_equipo` INT NOT NULL,
  `jornadas_id_equipo_local` VARCHAR(45) NOT NULL,
  `jornadas_id_equipo_visitante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  INDEX `fk_equipos_historico1_idx` (`historico_id_equipo` ASC) VISIBLE,
  INDEX `fk_equipos_clasificacion1_idx` (`clasificacion_id_equipo` ASC) VISIBLE,
  INDEX `fk_equipos_jornadas1_idx` (`jornadas_id_equipo_local` ASC, `jornadas_id_equipo_visitante` ASC) VISIBLE,
  CONSTRAINT `fk_equipos_historico1`
    FOREIGN KEY (`historico_id_equipo`)
    REFERENCES `fenixclub`.`historico` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipos_clasificacion1`
    FOREIGN KEY (`clasificacion_id_equipo`)
    REFERENCES `fenixclub`.`clasificacion` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipos_jornadas1`
    FOREIGN KEY (`jornadas_id_equipo_local` , `jornadas_id_equipo_visitante`)
    REFERENCES `fenixclub`.`jornadas` (`id_equipo_local` , `id_equipo_visitante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fenixclub`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fenixclub`.`jugadores` (
  `Dorsal` TEXT NULL DEFAULT NULL,
  `Nombre` TEXT NULL DEFAULT NULL,
  `Posición` TEXT NULL DEFAULT NULL,
  `Año_de_nacimiento` TEXT NULL DEFAULT NULL,
  `id_jugador` INT NOT NULL,
  `id_equipo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  INDEX `id_equipo` (`id_equipo` ASC) VISIBLE,
  CONSTRAINT `jugadores_ibfk_1`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `fenixclub`.`equipos` (`id_equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
