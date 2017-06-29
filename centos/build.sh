#!/usr/bin/env bash
setenforce 0
docker build -t appname:1.0.0 .
