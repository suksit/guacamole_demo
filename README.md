![](https://img.shields.io/badge/guacd-1.4.0-success)
![](https://img.shields.io/badge/guacamole-1.4.0-success)
![](https://img.shields.io/badge/mysql-8.0.28-informational)
![](https://img.shields.io/badge/nginx-1.21.6-informational)

This is a demo code for Apache Guacamole installation with Nginx reverse proxy running on Docker (with some sensible default options)

Tested on Docker Desktop for Windows with WSL 2

## Initialization

CLone the repository

```
git clone https://github.com/suksit/guacamole_demo.git
```

Next we have to setup environment variables

* Copy `.env.example` to `.env`
* Edit `.env` and provide `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD`
* You can enable TOTP by setting `TOTP_ENABLED` to `true`
* (Recommended) change `UID` and `GID` to that of the current user so MySQL data files will be created with current user's permission instead of root

Then start the containers and create database tables

```
cd /path/to/guacamole_demo
docker compose up -d --build
cd mysql
. initdb.sh
```

Then go to http://<your_machine_ip> and login with [guacamole default credentials](https://guacamole.apache.org/doc/gug/jdbc-auth.html#logging-in)

## Stopping

```
cd /path/to/guacamole_demo
docker compose down
```

## Starting
```
cd /path/to/guacamole_demo
docker compose up -d
```
