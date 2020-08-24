# IGV Web App Docker image

Clone the repo.

```
git clone https://github.com/olavurmortensen/igv-webapp-docker.git
```

Build the Docker image.

```
cd igv-webapp-docker
docker build . -t igv-webapp
```

Run the built image in a Docker container, making sure to map the correct port using `-p80:80`.

```
docker run --name igv-webapp -p80:80 igv-webapp
```

The IGV Web App should now be running on `http://0.0.0.0:80` (`http://0.0.0.0` for short).
