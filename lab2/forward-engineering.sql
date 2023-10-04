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
-- Table `mydb`.`application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`application` (
  `name` CHAR(50) NOT NULL,
  `description` VARCHAR(150) NULL,
  `release_date` DATETIME NOT NULL,
  `category_id` INT NOT NULL,
  `size` DOUBLE NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`developer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `name` CHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`download`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`download` (
  `app_name` CHAR(50) NOT NULL,
  `user_name` CHAR(50) NOT NULL,
  `review` INT NOT NULL,
  PRIMARY KEY (`app_name`, `user_name`),
  INDEX `fk_application_has_user_user1_idx` (`user_name` ASC) VISIBLE,
  INDEX `fk_application_has_user_application_idx` (`app_name` ASC) VISIBLE,
  CONSTRAINT `fk_application_has_user_application`
    FOREIGN KEY (`app_name`)
    REFERENCES `mydb`.`application` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_has_user_user1`
    FOREIGN KEY (`user_name`)
    REFERENCES `mydb`.`user` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`develop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`develop` (
  `developer_id` INT NOT NULL,
  `application_name` CHAR(50) NOT NULL,
  PRIMARY KEY (`developer_id`, `application_name`),
  INDEX `fk_developer_has_application_application1_idx` (`application_name` ASC) VISIBLE,
  INDEX `fk_developer_has_application_developer1_idx` (`developer_id` ASC) VISIBLE,
  CONSTRAINT `fk_developer_has_application_developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `mydb`.`developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_developer_has_application_application1`
    FOREIGN KEY (`application_name`)
    REFERENCES `mydb`.`application` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
