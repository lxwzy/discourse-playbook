#!/bin/bash
# If they requested a console, load pry instead
if [ "$*" == "c" -o "$*" == "console" ]
then
 (cd /var/www/discourse && RAILS_ENV=production sudo -H -E -u discourse bundle exec pry -r ./config/environment)
else
 (cd /var/www/discourse && RAILS_ENV=production sudo -H -E -u discourse bundle exec script/rails "$@")
fi