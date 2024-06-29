-- MySQL Script generated by MySQL Workbench
-- Sat Jun 29 16:42:20 2024
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`links` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `label` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_links_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_links_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`style`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`style` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `logo` BLOB NULL,
  `font_color` VARCHAR(7) NOT NULL DEFAULT '#000000',
  `bg_color` VARCHAR(7) NOT NULL DEFAULT '#ffffff',
  `position` ENUM("left", "center", "right") NOT NULL DEFAULT 'center',
  `font_size` INT NOT NULL DEFAULT 12,
  `status` TINYINT(1) NOT NULL DEFAULT 0,
  `hover_font_color` VARCHAR(7) NOT NULL DEFAULT '#000000',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ui_style`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ui_style` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `attribute` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  `hover` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_ui_style_users_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_ui_style_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;