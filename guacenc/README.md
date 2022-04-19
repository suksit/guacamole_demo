## Building Docker image

```
docker build -t guacenc .
```

## Converting a Guacamole RDP Recording to Video

```
export GID=$(id -g)
docker run -it --rm --user $UID:$GID -v $(pwd)/recording:/data guacenc /data/RECORDING_FILE
```
