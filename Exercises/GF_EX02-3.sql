-- MySQL Script generated by MySQL Workbench
-- Sun Jan 30 21:09:05 2022
-- Model: New Model    Version: 1.0
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
-- 1
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
-- 2
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `idproduct` INT NOT NULL,
  `product_name` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`idproduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
-- 3
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `iduser` INT NOT NULL,
  `user_email` VARCHAR(45) NULL DEFAULT NULL,
  `user_first_name` VARCHAR(45) NULL DEFAULT NULL,
  `user_last_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`download`
-- -----------------------------------------------------
-- 4
CREATE TABLE IF NOT EXISTS `mydb`.`download` (
  `iddownload` INT NOT NULL,
  `download_file_name` VARCHAR(45) NULL DEFAULT NULL,
  `download_date_time` VARCHAR(45) NULL DEFAULT NULL,
  `product_idproduct` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`iddownload`, `product_idproduct`, `user_iduser`),
  INDEX `fk_download_product_idx` (`product_idproduct` ASC) VISIBLE,
  INDEX `fk_download_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_download_product`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `mydb`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_download_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `mydb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
