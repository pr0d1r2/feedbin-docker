#!/bin/bash

GEM_HOME=~/.gems
PATH=$PATH:$GEM_HOME

#Ensure that postgres and redis containers have started successfully, this should probably not be so crap.
sleep 20

cd /opt/feedbin
psql -d $DATABASE_URL -f db/structure.sql
rake db:seed
rake db:migrate
bundle exec foreman start &
rackup
