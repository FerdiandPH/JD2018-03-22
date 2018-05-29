-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema kirova
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kirova` ;

-- -----------------------------------------------------
-- Schema kirova
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kirova` DEFAULT CHARACTER SET utf8 ;
USE `kirova` ;

-- -----------------------------------------------------
-- Table `kirova`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(70) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `residence_country` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kirova`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kirova`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`hotel` (
  `hotel_id` INT NOT NULL AUTO_INCREMENT,
  `hotel_name` VARCHAR(100) NOT NULL,
  `hotel_type` VARCHAR(45) NOT NULL,
  `star_rating` INT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `house_number` VARCHAR(45) NOT NULL,
  `contact_email` VARCHAR(45) NOT NULL,
  `contact_phone_number` VARCHAR(45) NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`hotel_id`),
  INDEX `fk_hotel_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_hotel_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `kirova`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kirova`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_name` VARCHAR(200) NOT NULL,
  `room_fact_number` VARCHAR(10) NULL,
  `people_amount` INT NOT NULL,
  `description` VARCHAR(1000) NULL,
  `cost` DECIMAL NOT NULL,
  `hotel_hotel_id` INT NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `fk_room_hotel1_idx` (`hotel_hotel_id` ASC),
  CONSTRAINT `fk_room_hotel1`
    FOREIGN KEY (`hotel_hotel_id`)
    REFERENCES `kirova`.`hotel` (`hotel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kirova`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`reservation` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `reservation_date` INT NOT NULL,
  `check_in_date` INT NOT NULL,
  `check_out_date` INT NOT NULL,
  `total_cost` DECIMAL NOT NULL,
  `room_room_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_reservation_room1_idx` (`room_room_id` ASC),
  INDEX `fk_reservation_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_reservation_room1`
    FOREIGN KEY (`room_room_id`)
    REFERENCES `kirova`.`room` (`room_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `kirova`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kirova`.`role_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kirova`.`role_has_users` (
  `role_role_id` INT NOT NULL,
  `users_user_id` INT NOT NULL,
  PRIMARY KEY (`role_role_id`, `users_user_id`),
  INDEX `fk_role_has_users_users1_idx` (`users_user_id` ASC),
  INDEX `fk_role_has_users_role1_idx` (`role_role_id` ASC),
  CONSTRAINT `fk_role_has_users_role1`
    FOREIGN KEY (`role_role_id`)
    REFERENCES `kirova`.`role` (`role_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_role_has_users_users1`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `kirova`.`users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `kirova`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'abc@gmail.com', 'abc123', 'John', 'Smith', NULL, 'UK', '+447874564567');
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'def@gmail.com', 'def123', 'Jacob', 'Irwin', NULL, 'Poland', '+485291111111');
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'hij@gmail.com', 'hij123', 'Aleksandr', 'Aleksandrov', 'Aleksandrovich', 'Belarus', '+375291111111');
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'klm@gmail.com', 'klm123', 'John', 'Smith', NULL, 'Austria', '+437874589567');
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'rst@gmail.com', 'rst123', 'Petr', 'Petrov', 'Petrovich', 'Belarus', '+375292222222');
INSERT INTO `kirova`.`users` (`user_id`, `email`, `password`, `first_name`, `last_name`, `middle_name`, `residence_country`, `phone_number`) VALUES (DEFAULT, 'nop@gmail.com', 'nop123', 'Ivan', 'Ivanov', 'Ivanovich', 'Russia', '+749597556983');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kirova`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`role` (`role_id`, `role_name`) VALUES (DEFAULT, 'admin');
INSERT INTO `kirova`.`role` (`role_id`, `role_name`) VALUES (DEFAULT, 'user');
INSERT INTO `kirova`.`role` (`role_id`, `role_name`) VALUES (DEFAULT, 'owner');
INSERT INTO `kirova`.`role` (`role_id`, `role_name`) VALUES (DEFAULT, 'guest');

COMMIT;


-- -----------------------------------------------------
-- Data for table `kirova`.`hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`hotel` (`hotel_id`, `hotel_name`, `hotel_type`, `star_rating`, `country`, `city`, `street`, `house_number`, `contact_email`, `contact_phone_number`, `user_user_id`) VALUES (DEFAULT, 'Resort Spa', 'Hotel', 5, 'Russia', 'Moscow', 'Horkogo', '82', 'spa@gmail.com', '+7395975339983', 3);
INSERT INTO `kirova`.`hotel` (`hotel_id`, `hotel_name`, `hotel_type`, `star_rating`, `country`, `city`, `street`, `house_number`, `contact_email`, `contact_phone_number`, `user_user_id`) VALUES (DEFAULT, 'Resort Appartment', 'Appartment', NULL, 'Austria', 'Vienna', 'Bahgasse', '4', 'weinapart@gmail.com', '+4395975339983', 4);
INSERT INTO `kirova`.`hotel` (`hotel_id`, `hotel_name`, `hotel_type`, `star_rating`, `country`, `city`, `street`, `house_number`, `contact_email`, `contact_phone_number`, `user_user_id`) VALUES (DEFAULT, 'Spa Appartment', 'Appartment', NULL, 'Austria', 'Vienna', 'Johann-Hoffmann Platz', '16', 'weinapart@gmail.com', '+4395975339983', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kirova`.`room`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`room` (`room_id`, `room_name`, `room_fact_number`, `people_amount`, `description`, `cost`, `hotel_hotel_id`) VALUES (DEFAULT, 'Room with a single bed', '100', 1, 'breakfast included', 50, 1);
INSERT INTO `kirova`.`room` (`room_id`, `room_name`, `room_fact_number`, `people_amount`, `description`, `cost`, `hotel_hotel_id`) VALUES (DEFAULT, 'Room with 2 double beds', '200', 4, NULL, 110, 1);
INSERT INTO `kirova`.`room` (`room_id`, `room_name`, `room_fact_number`, `people_amount`, `description`, `cost`, `hotel_hotel_id`) VALUES (DEFAULT, 'Apartment with terrace', NULL, 2, 'Apartment in heart of Vienna with terrace, double bed and kitchen', 90, 2);
INSERT INTO `kirova`.`room` (`room_id`, `room_name`, `room_fact_number`, `people_amount`, `description`, `cost`, `hotel_hotel_id`) VALUES (DEFAULT, 'Two-Bedroom apartment', NULL, 4, 'Apartment in heart of Vienna with 2 double beds and kitchen', 150, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kirova`.`reservation`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`reservation` (`reservation_id`, `reservation_date`, `check_in_date`, `check_out_date`, `total_cost`, `room_room_id`, `user_user_id`) VALUES (DEFAULT, 61481855662587, 61492914887284, 61493174113533, 270, 3, 2);
INSERT INTO `kirova`.`reservation` (`reservation_id`, `reservation_date`, `check_in_date`, `check_out_date`, `total_cost`, `room_room_id`, `user_user_id`) VALUES (DEFAULT, 61484793462731, 61493606288358, 61493692701377, 90, 2, 5);
INSERT INTO `kirova`.`reservation` (`reservation_id`, `reservation_date`, `check_in_date`, `check_out_date`, `total_cost`, `room_room_id`, `user_user_id`) VALUES (DEFAULT, 61486867235416, 61493260856405, 61493347273586, 50, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `kirova`.`role_has_users`
-- -----------------------------------------------------
START TRANSACTION;
USE `kirova`;
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (1, 1);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 1);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 2);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 3);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 4);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 5);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (2, 6);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (3, 3);
INSERT INTO `kirova`.`role_has_users` (`role_role_id`, `users_user_id`) VALUES (3, 4);

COMMIT;

