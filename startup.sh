#!/bin/bash

GEM_HOME=~/.gems
PATH=$PATH:$GEM_HOME

#Ensure that postgres and redis containers have started successfully, this should probably not be so crap.
#sleep 20

cd /opt/feedbin
#TODO: here we need to determine if we've already setup, or just need to migrate db:version prehaps?
rake db:drop && rake db:setup
bundle exec foreman start &
rackup
