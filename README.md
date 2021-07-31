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

root@9bcc915e1cb:~# embulk example ./try1
root@:~# embulk guess ./try1/seed.yml -o config.yml
root@:~# embulk preview config.yml
root@:~# embulk run config.yml
```