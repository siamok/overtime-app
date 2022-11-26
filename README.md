## Overtime App
Note:
Project based on Udemy course: Professionmal Ruby on Rails coding course - with my touch to it ;)

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI:
- Bootstrap -> formatting

## Installation:
Postgresql Installation on WSL2
```
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

sudo service postgresql start
```
PS config
```
sudo -u postgres psql
postgres=# CREATE USER overtime PASSWORD 'overtime' CREATEDB;
```
Locate pg_hba.conf
and replace
`local   all postgres peer` with `local   all postgres md5`

```
bundle exec rake db:setup

rspec
```


