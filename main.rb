#!/usr/bin/env ruby
require 'optparse'
require 'ruby-station'; RubyStation.parse_argv

RubyStation::Helper::Rails.run
