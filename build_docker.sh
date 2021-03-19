#!/bin/bash

./generate_htsh.sh
docker build -t zpex/web-pdf-toolbox .
