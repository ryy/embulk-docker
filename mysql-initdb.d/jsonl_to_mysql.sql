CREATE DATABASE IF NOT EXISTS embulk;

use embulk;

CREATE TABLE IF NOT EXISTS jsonl_to_mysql
(
  `id` bigint NOT NULL PRIMARY KEY,
  `str` varchar(255) DEFAULT NULL,
  `num` bigint DEFAULT NULL,
  `bool` boolean DEFAULT NULL,
  `time_at` timestamp NULL DEFAULT NULL
);