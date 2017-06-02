#!/bin/bash
set -eu

docker-compose exec redmine bash -c "bundle exec rake redmine:load_default_data REDMINE_LANG=en"

./plugins/redmine-backlogs.sh
docker-compose restart redmine

./plugins/redmine-code-review.sh
docker-compose restart redmine
