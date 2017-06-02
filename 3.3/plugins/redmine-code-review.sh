#!/bin/bash
set -eu

docker-compose exec redmine bash -c "cd plugins \
&& echo http_proxy=$HTTP_PROXY >> ~/.wgetrc \
&& echo https_proxy=$HTTPS_PROXY >> ~/.wgetrc \
&& wget https://bitbucket.org/haru_iida/redmine_code_review/downloads/redmine_code_review-0.8.0.zip \
&& apt-get install unzip \
&& unzip -q redmine_code_review-0.8.0.zip \
&& rm redmine_code_review-0.8.0.zip \
&& cd /usr/src/redmine \
&& rake redmine:plugins:migrate RAILS_ENV=production"
