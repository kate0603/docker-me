FROM centos:latest

#安装python
RUN rpm -iUvh http://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm \
 && yum update -y && yum install -y python-devel python-pip vim gcc-c++ gcc mysql-devel postgresql python-psycopg2\
 && yum clean all
RUN mkdir ~/.pip \
 && echo -e "[global] \nindex-url = http://mirrors.aliyun.com/pypi/simple/ \n[install] \ntrusted-host=mirrors.aliyun.com" > ~/.pip/pip.conf

COPY sitecustomize.py /usr/lib/python2.7/site-packages/
RUN mkdir /data /data/operations
WORKDIR /data/operations
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip --no-cache-dir install -r requirements.txt

#时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#uwsgi
RUN pip --no-cache-dir install uwsgi
CMD ["uwsgi", "--ini", "/data/operations/uwsgi.ini"]
