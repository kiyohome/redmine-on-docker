#!/bin/bash
set -eu

# load default data

docker-compose exec redmine bash -c "bundle exec rake redmine:load_default_data REDMINE_LANG=en"

# install the backlogs plugin

docker-compose exec redmine bash -c "apt-get update -y \
&& cd plugins \
&& git clone https://github.com/backlogs/redmine_backlogs.git \
&& cd redmine_backlogs \
&& git branch -r \
&& git checkout origin/feature/redmine3 \
&& sed -i -e 's/gem \"nokogiri\"/#gem \"nokogiri\"/' Gemfile \
&& sed -i -e 's/gem \"capybara\"/#gem \"capybara\"/' Gemfile \
&& sed -i -e 's/gem \"thin\"/#gem \"thin\"/' Gemfile \
&& cd /usr/src/redmine \
&& bundle install --without development test \
&& RAILS_ENV=production \
&& export RAILS_ENV \
&& bundle exec rake db:migrate \
&& bundle exec rake tmp:cache:clear \
&& bundle exec rake tmp:sessions:clear \
&& bundle exec rake redmine:backlogs:install story_trackers=Bug task_tracker=Bug"

docker-compose restart redmine

# install the code review plugin

docker-compose exec redmine bash -c "cd plugins \
&& echo http_proxy=$HTTP_PROXY >> ~/.wgetrc \
&& echo https_proxy=$HTTPS_PROXY >> ~/.wgetrc \
&& wget https://bitbucket.org/haru_iida/redmine_code_review/downloads/redmine_code_review-0.8.0.zip \
&& apt-get install unzip \
&& unzip -q redmine_code_review-0.8.0.zip \
&& rm redmine_code_review-0.8.0.zip \
&& cd /usr/src/redmine \
&& rake redmine:plugins:migrate RAILS_ENV=production"

docker-compose restart redmine
