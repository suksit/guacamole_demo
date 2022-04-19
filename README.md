## Initialization (First time only)

```
cd /path/to/guacamole_demo
docker compose up -d --build
cd mysql
. initdb.sh
```

Then browse to http://<your_machine_ip>

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
