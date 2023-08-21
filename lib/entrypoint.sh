#!/bin/sh

set -e

gem install standardrb $ADDITIONAL_INSTALLED_GEMS

ruby /action/lib/index.rb
