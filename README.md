# Web PDF Toolbox

Very simple web toolbox to combine, compress, and split PDF using [Ghostscript](https://www.ghostscript.com/).

![Screenshot of Web PDF Toolbox](https://raw.githubusercontent.com/natpuch/web-pdf-toolbox/main/img/screenshot.png)

## Installation

The easiest way to install _Web PDF Toolbox_ is through Docker.

## Docker CLI

Deploying _Web PDF Toolbox_ through Docker CLI is only recommended for testing (use Docker Compose for other cases). Run the command below and your instance will be available on port `25568`:

```bash
docker run \
	-p 25568:80 \
	--env TZ=Europe/Paris \
	-v './pdf/':/tmp/pdf/ \
	zpex/web-pdf-toolbox
```


## Docker Compose

To deploy _Web PDF Toolbox_ using Docker Compose, create a `docker-compose.yml` file with the content below. Then, run `docker-compose up -d` in a terminal. Your instance will be available on port `25568`.

```yaml
version: "3.4"
services:
  web-pdf-toolbox:
    container_name: web-pdf-toolbox
    image: zpex/web-pdf-toolbox
    environment:
      - TZ=Europe/Paris
    ports:
      - 25568:80
    volumes:
        - ./pdf/:/tmp/pdf/
```


