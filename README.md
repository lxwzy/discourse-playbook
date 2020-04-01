# discourse-playbook
An ansible playbook for discourse

## Setup

### 1. Add host for discourse

You should modify `hosts`

### 2. Modify `site.yml`

Some roles are **optional**, you can remove it

### 3. Config `group_vars/discourse/setting.json` like `group_vars/setting_example.json`

Vars begin with `_` is **optional**, you shoud remove `_` before use them

### 4. Get password from `.discourse_password`

## Roles

- lib

Libs for discourse

- node

Node.js for compile frount assets

- redis

Redis for cache

- postgresql

PostgreSQL Server

- ruby

Ruby runtime installed by [ruby-build](https://github.com/sstephenson/ruby-build)

- discourse

Install Discourse

- sidekiq

For cron jobs

- nginx

Web Server

- certbot

Request certs for HTTPS

- cli

Some script in [discourse_docker](https://github.com/discourse/discourse_docker)