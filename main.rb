#!/usr/bin/env ruby
require 'optparse'
require 'ruby-station'; RubyStation.parse_argv

# setup database
unless File.exist?(RubyStation.data_path("production.sqlite3"))
  yml_path = File.join(File.dirname(__FILE__), "config/database.yml")
  conf = YAML.load_file(yml_path)
  conf["production"]["database"] = RubyStation.data_path("production.sqlite3")
  File.open(yml_path, "w"){|f| YAML.dump(conf, f) }

  system "rake db:migrate db:seed RAILS_ENV=production"
end

ARGV.push "--port=#{RubyStation.port}"
ARGV.push "--environment=production"
load File.join(File.dirname(__FILE__), 'script/server')
