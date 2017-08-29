#直接使用python alpine镜像库
FROM amancevice/pandas:0.20.3-python2-alpine
#替换镜像源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

#设置时区语言
ENV TZ Asia/Shanghai
#安装nginx
RUN apk add nginx py-pip python libpq --no-cache

COPY server/requirements.txt /tmp/requirements.txt 
RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
        mariadb-dev \
        gcc \
        g++ \
        make \
        linux-headers \
        jpeg-dev \
        postgresql-dev \
        pcre-dev \
        python-dev \
    \
    && pip install  -r /tmp/requirements.txt -i https://pypi.doubanio.com/simple/ --no-cache-dir \
    && apk del .build-deps \
	\
	&& find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +    

#环境修正
RUN sed -i 's/>= 80300/>= 80301/g' /usr/lib/python2.7/site-packages/psycopg2/extras.py \
    && echo "import sys;reload(sys).setdefaultencoding('utf-8');" > \
    /usr/lib/python2.7/site-packages/sitecustomize.py

#创建工作路径
RUN mkdir -p /data/web/
WORKDIR /data/web/
#复制文件 使用.dockerignore忽略 *.pyc文件
COPY . /data/web/
COPY nginx.conf /etc/nginx/nginx.conf
#此类应用环境变量 非系统需要环境变量最好写在docker-compose
# ENV ZK_HOSTS=192.168.5.30:2181,192.168.5.30:2182,192.168.5.30:2183 \
#     ZK_PATH=/platform/operation_dq2 \
#     ZK_AUTH=wangqq:123456

ENTRYPOINT uwsgi --ini /data/web/server/uwsgi.ini && nginx -g "daemon off;" 
