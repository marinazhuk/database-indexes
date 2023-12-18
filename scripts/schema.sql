create database if not exists `test`;

use test;

CREATE TABLE IF NOT EXISTS `users` (
    id int NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(20) NOT NULL,
    birthday DATE NOT NULL,
    PRIMARY KEY(id));

