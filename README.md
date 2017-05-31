# redmine-on-docker

## Tools

- [Redmine](http://www.redmine.org/)
- Plugins
  - [Redmine Backlogs](https://backlogs.github.io/www/)

## Installation

- Execute the following commands

```
$ git clone https://github.com/kiyohome/redmine-on-docker.git
$ cd 3.3/
$ docker-compose up -d
$ ./plugins.sh
```

- Access "http://localhost:3000/" in the browser
- Sign in
  - Login: admin
  - Password: admin
- Add Story/Task trackers
  - Administration > Trackers > New Tracker
- Configure Redmine Backlogs
  - Administration > Plugins > Configure of Redmine Backlogs
  - Story trackers: Bug -> Story
  - Default story tracker: Bug -> Story
  - Task tracker: Bug -> Task
- Create project
  - Projects > New project
  - Modules: Check Backlogs
- Let's enjoy Redmine life!