# redmine-on-docker

## Tools

- [Redmine](http://www.redmine.org/)
- Plugins
  - [Redmine Backlogs](https://backlogs.github.io/www/)

## How to install

- git clone and install
```
  $ git clone https://github.com/kiyohome/redmine-on-docker.git
  $ cd 3.3/
  $ docker-compose up -d
```

## How to configure

### GitBucket

- access "http://localhost:8080/" in the browser
- sign in
  - Username: root
  - Password: root
- create the sample repository
  - plus mark at the top right of the screen > New Repository
    - Repository name: nablarch-example-web
  - git clone the nablarch-example-web and push new repository
```
git clone https://github.com/nablarch/nablarch-example-web.git
cd nablarch-example-web
git remote rm origin
git remote add origin http://localhost:8080/git/root/nablarch-example-web.git
git push -u origin master
```

### Redmine

- install plugins
```
  $ cd 3.3/
  $ ./plugins.sh
```
- access "http://localhost:3000/" in the browser
- sign in
  - Login: admin
  - Password: admin
- create the project
  - Projects > New project

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