# redmine-on-docker

## Tools

- [Redmine](http://www.redmine.org/)
- Plugins
  - [Redmine Backlogs](https://backlogs.github.io/www/)
  - [Code Review](http://www.redmine.org/plugins/redmine_code_review)
  - [Redmine GitHub Hook](https://github.com/koppen/redmine_github_hook)
- [GitBucket](https://github.com/gitbucket/gitbucket)

## How to install

- Run the following commands
```
  $ git clone https://github.com/kiyohome/redmine-on-docker.git
  $ cd 3.3/
  $ docker-compose up -d
  $ cd ../gitbucket
  $ docker-compose up -d
```

## How to configure

### GitBucket

- Access "http://localhost:8080/" in the browser
- Sign in
  - Username: root
  - Password: root
- Create the sample repository
  - Plus mark at the top right of the screen > New Repository
    - Repository name: nablarch-example-web
  - Run the following commands on your local machine
```
  $ git clone https://github.com/nablarch/nablarch-example-web.git
  $ cd nablarch-example-web
  $ git remote rm origin
  $ git remote add origin http://localhost:8080/git/root/nablarch-example-web.git
  $ git push -u origin master
```
- Refresh the page in the browser

### Redmine

- Install the plugins
```
  $ cd 3.3/
  $ ./plugins.sh
```
- Access "http://localhost:3000/" in the browser
- Sign in
  - Login: admin
  - Password: admin
- Configure roles and permissions for plugins
  - Administration > Roles and permissions
  - Manager/Developer: add all permissions of Backlogs/Code reviews
- Create the project
  - Projects > New project
    - Name: nablarch-example-web
    - Identifier: nablarch-example-web
    - Modules:
      - Backlogs: ON
      - CodeReview: ON
- Set the repository
  - Get the bare repository
```
  $ docker-compose exec redmine bash
  $ mkdir -p /var/redmine/git_repositories
  $ cd /var/redmine/git_repositories
  $ git clone --bare http://gitbucket:8080/git/root/nablarch-example-web.git
  $ chown -R redmine:redmine /var/redmine/
```
  - Add new repository on project settings page
    - Settings > Repositories tab > New repository
      - SCM: Git
      - Identifier: nablarch-example-web
      - Path to repository: /var/redmine/git_repositories/nablarch-example-web.git

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

### Redmine Code Review

- Add the Feedback tracker
  - Administration > Trackers > New Tracker
- Enable the Feedback tracker on the project setting page
  - Settings > Information > Trackers
- Configure the Code Review
  - Settings > Code review
    - Select the tracker for code reviews.: Feedback
    - Select the tracker for code review assignments.: Story

### Redmine Github Hook

- Add webhook on GitBucket
  - Project Settings > Service Hooks tab > Add webhook
    - Payload URL: http://redmine:3000/github_hook?project_id=nablarch-example-web