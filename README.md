# 🐋 embulk-docker

## Setup
```bash
your-local-pc$ cp .env_sample .env
```

```bash
your-local-pc$ docker compose build
your-local-pc$ docker compose up
```

```bash
your-local-pc$ docker compose exec embulk bash
```

```bash
root@:~# cd embulk_bundle/ && embulk bundle && cd ../
```

## Quickstart
```bash
local$ docker compose exec embulk bash

root@:~# embulk example ./try1

root@:~# embulk guess ./try1/seed.yml -o config.yml

root@:~# embulk preview config.yml

root@:~# embulk run config.yml
```

## CSV to MySQL
```bash
local$ docker compose exec embulk bash

root@:~# embulk run ./examples/csv_to_mysql/config.yml

local$ docker compose exec mysql bash

root@:~# mysql -u root -p
Enter password: root

mysql> use embulk;

mysql> select * from csv_to_mysql \G;
*************************** 1. row ***************************
      id: 1
 account: 32864
    time: 2015-01-27 19:23:49
purchase: 2015-01-27 00:00:00
 comment: embulk
*************************** 2. row ***************************
      id: 2
 account: 14824
    time: 2015-01-27 19:01:23
purchase: 2015-01-27 00:00:00
 comment: embulk jruby
*************************** 3. row ***************************
      id: 3
 account: 27559
    time: 2015-01-28 02:20:02
purchase: 2015-01-28 00:00:00
 comment: Embulk "csv" parser plugin
*************************** 4. row ***************************
      id: 4
 account: 11270
    time: 2015-01-29 11:54:36
purchase: 2015-01-29 00:00:00
 comment: NULL
4 rows in set (0.00 sec)
```

## Jsonl to MySQL
```bash
local$ docker compose exec embulk bash

root@:~# embulk run ./examples/jsonl_to_mysql/config.yml

local$ docker-compose exec mysql bash

root@:~# mysql -u root -p

mysql> use embulk;

mysql> select * from jsonl_to_mysql \G;
*************************** 1. row ***************************
     id: 1
    str: a
    num: 1
   bool: 1
time_at: 2017-01-01 00:00:00
*************************** 2. row ***************************
     id: 2
    str: b
    num: 2
   bool: 1
time_at: 2018-02-01 00:00:00
*************************** 3. row ***************************
     id: 3
    str: c
    num: 3
   bool: 0
time_at: 2019-03-01 00:00:00
*************************** 4. row ***************************
     id: 4
    str: d
    num: 4
   bool: 0
time_at: 2020-04-01 00:00:00
*************************** 5. row ***************************
     id: 5
    str: e
    num: 5
   bool: 1
time_at: 2021-05-01 00:00:00
5 rows in set (0.00 sec)
```

## Jsonl to BigQuery
- Create a GCP project in advance.

- Set the GCP information in `.env`
  - `JSONL_TO_BIGQUERY_GCP_JSON_KEY_FILE_PATH`
    - Your service account key
  - `JSONL_TO_BIGQUERY_GCP_PROJECT_ID`
    - Your project id

### Create dataset
```bash
local$ docker compose exec gcloud bash

# login Google Cloud SDK
root@:~# gcloud auth login

# set use project
root@:~# gcloud config set project your_project_id # <- Specify the project ID you created.

# create dataset
root@:~# root@8a5a0c8aa90d:~# bq mk embulk
```

### Import BigQuery
```bash
local$ docker compose exec embulk bash

root@:~# embulk run ./examples/jsonl_to_bigquery/config.yml.liquid
```

```
local$ docker-compose exec gcloud bash
root@8a5a0c8aa90d:~# bq query "select * from embulk.jsonl_to_bigquery"

Waiting on bqjob_xxxxxxxxxxxxxxx ... (0s) Current status: DONE   
+-----+------+
| str | num  |
+-----+------+
| a   | 1000 |
| b   | 2000 |
| c   | 3000 |
| d   | 4000 |
| e   | 5000 |
+-----+------+
```

## DynamoDB to MySQL
```bash
local$ docker compose exec embulk bash

root@:~# embulk run ./examples/dynamodb_to_mysql/config.yml

local$ docker compose exec mysql bash

root@:~# mysql -u root -p
Enter password: root

mysql> use embulk;

mysql> select * from dynamodb_to_mysql \G;
*************************** 1. row ***************************
uuid: a9c12546-c5c4-9f22-2bbb-82blcc90b67f
name: Suzuki Jiro
*************************** 2. row ***************************
uuid: b1d23546-d6d5-1f33-3ccc-93cmdde0c78g
name: Sato Hanako
*************************** 3. row ***************************
uuid: c2e34546-e7e6-2g44-4ddd-a4enffe1d89h
name: Takahashi Ichiro
*************************** 4. row ***************************
uuid: d3f45546-f8f7-3h55-5eee-b5fohff2e90i
name: Tanaka Saburo
*************************** 5. row ***************************
uuid: e4g56546-g9g8-4i66-6fff-c6gphgg3f01j
name: Nakamura Shizuka
...
...
...
```

## DynamoDB to DynamoDB
```bash
local$ docker compose exec embulk bash

root@:~# embulk run ./examples/dynamodb_to_dynamodb/config.yml
```

On your host machine.
````bash
open http://localhost:8001/
```