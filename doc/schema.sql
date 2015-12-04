-- MySQL Workbench Synchronization
-- Generated: 2015-12-04 10:04
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: David

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `gamers-tournament` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(100) NOT NULL COMMENT '',
  `password` VARCHAR(100) NOT NULL COMMENT '',
  `mail` VARCHAR(150) NULL DEFAULT NULL COMMENT '',
  `country` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `team_id` INT(11) NULL DEFAULT NULL COMMENT '',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT '',
  `modified_at` DATETIME NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_users_team_idx` (`team_id` ASC)  COMMENT '',
  CONSTRAINT `fk_users_team`
    FOREIGN KEY (`team_id`)
    REFERENCES `gamers-tournament`.`teams` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`tournaments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(100) NOT NULL COMMENT '',
  `description` TEXT NULL DEFAULT NULL COMMENT '',
  `game_id` INT(11) NOT NULL COMMENT '',
  `teams_limit` INT(11) NULL DEFAULT NULL COMMENT '',
  `signup_start` DATETIME NULL DEFAULT NULL COMMENT '',
  `signup_end` DATETIME NULL DEFAULT NULL COMMENT '',
  `check_in` DATETIME NULL DEFAULT NULL COMMENT '',
  `date` DATETIME NULL DEFAULT NULL COMMENT '',
  `mode` SMALLINT(6) NULL DEFAULT NULL COMMENT '',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT '',
  `modified_at` DATETIME NULL DEFAULT NULL COMMENT '',
  `tournamentscol` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_tournaments_games1_idx` (`game_id` ASC)  COMMENT '',
  CONSTRAINT `fk_tournaments_games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `gamers-tournament`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`matches` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `tournament_id` INT(11) NOT NULL COMMENT '',
  `map` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `team1_id` INT(11) NOT NULL COMMENT '',
  `team2_id` INT(11) NOT NULL COMMENT '',
  `score_team1` INT(11) NULL DEFAULT NULL COMMENT '',
  `score_team2` INT(11) NULL DEFAULT NULL COMMENT '',
  `stream` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT '',
  `modified_at` DATETIME NULL DEFAULT NULL COMMENT '',
  INDEX `fk_match_tournament1_idx` (`tournament_id` ASC)  COMMENT '',
  PRIMARY KEY (`id`, `team1_id`, `team2_id`)  COMMENT '',
  INDEX `fk_match_team2_idx` (`team2_id` ASC)  COMMENT '',
  CONSTRAINT `fk_match_tournament1`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `gamers-tournament`.`tournaments` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_team1`
    FOREIGN KEY (`team1_id`)
    REFERENCES `gamers-tournament`.`teams` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_match_team2`
    FOREIGN KEY (`team2_id`)
    REFERENCES `gamers-tournament`.`teams` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`teams` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(100) NOT NULL COMMENT '',
  `location` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `created_at` DATETIME NULL DEFAULT NULL COMMENT '',
  `modified_at` DATETIME NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`games` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`bos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `phase` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `gamers-tournament`.`bos_tournaments` (
  `bos_id` INT(11) NOT NULL COMMENT '',
  `tournaments_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`bos_id`, `tournaments_id`)  COMMENT '',
  INDEX `fk_bos_has_tournaments_tournaments1_idx` (`tournaments_id` ASC)  COMMENT '',
  INDEX `fk_bos_has_tournaments_bos1_idx` (`bos_id` ASC)  COMMENT '',
  CONSTRAINT `fk_bos_has_tournaments_bos1`
    FOREIGN KEY (`bos_id`)
    REFERENCES `gamers-tournament`.`bos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bos_has_tournaments_tournaments1`
    FOREIGN KEY (`tournaments_id`)
    REFERENCES `gamers-tournament`.`tournaments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
