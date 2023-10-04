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
-- Table `mydb`.`reward_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reward_card` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`software_developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`software_developer` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `mobile_number` VARCHAR(15) NOT NULL,
  `email_address` VARCHAR(320) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `reward_card_id` INT NOT NULL,
  PRIMARY KEY (`id`, `reward_card_id`),
  INDEX `fk_software_developer_reward_card1_idx` (`reward_card_id` ASC) VISIBLE,
  CONSTRAINT `fk_software_developer_reward_card1`
    FOREIGN KEY (`reward_card_id`)
    REFERENCES `mydb`.`reward_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`privilege` (
  `id` INT NOT NULL,
  `reward_card_id` INT NOT NULL,
  `privilege` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `reward_card_id`),
  INDEX `fk_privilege_reward_card_idx` (`reward_card_id` ASC) VISIBLE,
  CONSTRAINT `fk_privilege_reward_card`
    FOREIGN KEY (`reward_card_id`)
    REFERENCES `mydb`.`reward_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`account` (
  `username` CHAR(15) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `software_developer_id` INT NOT NULL,
  PRIMARY KEY (`username`, `software_developer_id`),
  INDEX `fk_account_software_developer1_idx` (`software_developer_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_software_developer1`
    FOREIGN KEY (`software_developer_id`)
    REFERENCES `mydb`.`software_developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`software_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`software_resource` (
  `number` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `manufacturer_name` VARCHAR(45) NOT NULL,
  `rent_cost` DOUBLE NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rent` (
  `account_username` CHAR(15) NOT NULL,
  `software_resource_number` INT NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `start_date` DATETIME NULL DEFAULT NOW(),
  `end_date` DATETIME NOT NULL,
  PRIMARY KEY (`account_username`, `software_resource_number`),
  INDEX `fk_account_has_software_resource_software_resource1_idx` (`software_resource_number` ASC) VISIBLE,
  INDEX `fk_account_has_software_resource_account1_idx` (`account_username` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_software_resource_account1`
    FOREIGN KEY (`account_username`)
    REFERENCES `mydb`.`account` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_software_resource_software_resource1`
    FOREIGN KEY (`software_resource_number`)
    REFERENCES `mydb`.`software_resource` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tracking_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tracking_activity` (
  `date` DATETIME NOT NULL,
  `account_username` CHAR(15) NOT NULL,
  PRIMARY KEY (`date`, `account_username`),
  INDEX `fk_tracking_activity_account1_idx` (`account_username` ASC) VISIBLE,
  CONSTRAINT `fk_tracking_activity_account1`
    FOREIGN KEY (`account_username`)
    REFERENCES `mydb`.`account` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
