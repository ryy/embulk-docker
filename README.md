# 🐋 embulk-docker

## Setup
```
local$ docker-compose up -d
```

```
local$ docker-compose exec embulk bash
```

```
root@:~# cd mkbundle/ && embulk bundle

> 2021-07-30 17:17:56.118 +0000: Embulk v0.9.23
> Don't run Bundler as root. Bundler can ask for sudo if it is needed, and
> installing your bundle as root will break this application for all non-root
> users on this machine.
> Using bundler 1.16.0
> Using msgpack 1.4.1 (java)
> Using embulk 0.10.32 (java)
> Bundle complete! 1 Gemfile dependency, 3 gems now installed.
> Bundled gems are installed into `/root/mkbundle`
```

## Quickstart
```
local$ docker-compose exec embulk bash

root@:~# embulk example ./try1

root@:~# embulk guess ./try1/seed.yml -o config.yml

root@:~# embulk preview config.yml

root@:~# embulk run config.yml
```

## CSV to MySQL
```
local$ docker-compose exec embulk bash

root@:~# embulk run ./examples/csv_to_mysql/config.yml

local$ docker-compose exec mysql bash

root@:~# mysql -u root -p

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
```
local$ docker-compose exec embulk bash

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