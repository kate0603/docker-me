FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk add --no-cache gcc g++ make python2 python2-dev py2-pip linux-headers tzdata && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 额外pip包所需库
RUN apk add --no-cache postgresql-dev jpeg-dev freetype-dev mariadb-dev

COPY requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt -i https://mirrors.ustc.edu.cn/pypi/web/simple

RUN mkdir -p /data/web/ && pip install uwsgi -i https://mirrors.ustc.edu.cn/pypi/web/simple
WORKDIR /data/web/

CMD ["uwsgi", "--ini", "/data/web/uwsgi.ini"]
