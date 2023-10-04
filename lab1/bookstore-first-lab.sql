-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Library` DEFAULT CHARACTER SET utf8 ;
USE `Library` ;

-- -----------------------------------------------------
-- Table `Library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`book` (
  `isbn` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `domain` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`student` (
  `sid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `department` VARCHAR(45) NULL,
  `major` VARCHAR(45) NULL,
  PRIMARY KEY (`sid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`burrowed_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`burrowed_book` (
  `id` INT NOT NULL,
  `burrowed_bookcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`book_has_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`book_has_student` (
  `book_isbn` INT NOT NULL,
  `student_sid` INT NOT NULL,
  PRIMARY KEY (`book_isbn`, `student_sid`),
  INDEX `fk_book_has_student_student1_idx` (`student_sid` ASC) VISIBLE,
  INDEX `fk_book_has_student_book_idx` (`book_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_student_book`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `Library`.`book` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_student_student1`
    FOREIGN KEY (`student_sid`)
    REFERENCES `Library`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`borrowed_by`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`borrowed_by` (
  `book_isbn` INT NOT NULL,
  `student_sid` INT NOT NULL,
  `burrowed_at` INT NOT NULL,
  `borrowing_period` INT NOT NULL,
  PRIMARY KEY (`book_isbn`, `student_sid`),
  INDEX `fk_book_has_student1_student1_idx` (`student_sid` ASC) VISIBLE,
  INDEX `fk_book_has_student1_book1_idx` (`book_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_student1_book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `Library`.`book` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_student1_student1`
    FOREIGN KEY (`student_sid`)
    REFERENCES `Library`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
