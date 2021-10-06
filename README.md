# Web PDF Toolbox

Very simple web toolbox to combine, compress, split PDF, and convert between images and PDF, change contrast of PDF, and add text watermark on PDF using [Ghostscript](https://www.ghostscript.com/) and [ImageMagick](https://imagemagick.org/index.php).

![Screenshot of Web PDF Toolbox](https://raw.githubusercontent.com/natpuch/web-pdf-toolbox/main/img/screenshot.png)

⚠️ WARNING: This toolbox is not secure and should not be exposed publicly. If exposed, someone might be able to access recently uploaded documents. Please, only use this toolbox behind an authentification portal or on a LAN (and access it via VPN if needed).

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

## Dependencies
- [Bootstrap](https://getbootstrap.com/): [MIT License](https://github.com/twbs/bootstrap/blob/main/LICENSE)
- [JQuery](https://jquery.com/): [MIT License](https://github.com/jquery/jquery/blob/main/LICENSE.txt)
- [Ghostscript](https://www.ghostscript.com/): [GNU Affero General Public License](https://www.gnu.org/licenses/agpl-3.0.en.html)
- [ImageMagick](https://imagemagick.org/index.php): [ImageMagick License](https://imagemagick.org/script/license.php)
- [Bash on steroids](https://github.com/tinoschroeter/bash_on_steroids): [MIT License](https://choosealicense.com/licenses/mit/)
- [Font Awesome](https://fontawesome.com/): [Creative Commons Attribution 4.0](https://fontawesome.com/license/free)
