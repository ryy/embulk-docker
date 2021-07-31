CREATE DATABASE IF NOT EXISTS embulk;

use embulk;

CREATE TABLE IF NOT EXISTS csv_to_mysql
(
  `id` bigint DEFAULT NULL,
  `account` text DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `purchase` timestamp NULL DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
);