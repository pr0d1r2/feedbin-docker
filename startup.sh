#!/bin/bash

GEM_HOME=~/.gems
PATH=$PATH:$GEM_HOME

cd /opt/feedbin
rm db/migrate/*
rake db:setup
bundle exec foreman start &
rackup
