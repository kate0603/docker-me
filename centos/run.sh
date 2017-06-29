#!/usr/bin/sh

docker run -i -v /root/data/code:/data/code metrics:1.0.0 python $1
