# redmine-on-docker

## Tools

- [Redmine](http://www.redmine.org/)
- Plugins
  - [Redmine Backlogs](https://backlogs.github.io/www/)

## How to install

- run the following commands

```
  $ git clone https://github.com/kiyohome/redmine-on-docker.git
  $ cd 3.3/
  $ docker-compose up -d
  $ ./plugins.sh
```

- access "http://localhost:3000/" in the browser
- sign in
  - Login: admin
  - Password: admin
- create the project
  - Projects > New project

## How to configure

### Redmine Backlogs

- Add the Story/Task trackers
  - Administration > Trackers > New Tracker
- Configure the Backlogs
  - Administration > Plugins > Configure of Redmine Backlogs
    - Story trackers: Bug -> Story
    - Default story tracker: Bug -> Story
    - Task tracker: Bug -> Task
- Enable the Story/Task trackers on the project setting page
  - Settings > Information > Trackers
- Enable the module on the project setting page

### Redmine Code Review

- Add the Feedback tracker
  - Administration > Trackers > New Tracker
- Enable the Feedback tracker on the project setting page
  - Settings > Information > Trackers
- Enable the module on the project setting page
  - Settings > Modules
- Configure the Code Review
  - Settings > Code review
    - Tracker: Feedback
- Create the repository
  - Settings > Repositories > New repository