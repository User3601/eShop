-- MySQL Workbench Synchronization
-- Generated: 2019-07-02 13:34
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: nicolai.drapp

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `eShop_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `eShop_db`.`product` (
  `idproduct` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(5546) NULL DEFAULT NULL,
  `price` FLOAT(11) NOT NULL,
  `amount` INT(11) NOT NULL,
  `picture_ref` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproduct`),
  UNIQUE INDEX `idproduct_UNIQUE` (`idproduct` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `eShop_db`.`users` (
  `idusers` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `street_with_number` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `area_code` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `eShop_db`.`orders` (
  `idorder` INT(11) NOT NULL,
  `users_idusers` INT(11) NOT NULL,
  `date` TIMESTAMP(19) NOT NULL,
  INDEX `fk_orders_users_idx` (`users_idusers` ASC),
  PRIMARY KEY (`idorder`),
  CONSTRAINT `fk_orders_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `eShop_db`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `eShop_db`.`orders_has_product` (
  `orders_idorder` INT(11) NOT NULL,
  `product_idproduct` INT(11) NOT NULL,
  PRIMARY KEY (`orders_idorder`, `product_idproduct`),
  INDEX `fk_orders_has_product_product1_idx` (`product_idproduct` ASC),
  INDEX `fk_orders_has_product_orders1_idx` (`orders_idorder` ASC),
  CONSTRAINT `fk_orders_has_product_orders1`
    FOREIGN KEY (`orders_idorder`)
    REFERENCES `eShop_db`.`orders` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_product_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `eShop_db`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Placeholder table for view `eShop_db`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eShop_db`.`view1` (`id` INT);


USE `eShop_db`;

-- -----------------------------------------------------
-- View `eShop_db`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eShop_db`.`view1`;
USE `eShop_db`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
