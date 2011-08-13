# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rdoc/task'

require 'tasks/rails'

# -- gem creation

PROJECT_NAME = "moneyrail"

begin
  require 'jeweler'
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Jeweler::Tasks.new do |gemspec|
  gemspec.name = "#{PROJECT_NAME}"
  gemspec.summary = "Household account book, written in Rails"
  gemspec.email = "yutaka.hara/at/gmail.com"
  gemspec.homepage = "http://github.com/yhara/#{PROJECT_NAME}"
  gemspec.description = gemspec.summary
  gemspec.authors = ["Yutaka HARA"]
  gemspec.add_dependency('rails', '= 2.3.12')
  gemspec.add_dependency('sqlite3')
  gemspec.add_development_dependency('test-unit', '= 1.2.3')
  gemspec.add_development_dependency('jeweler')
  gemspec.add_dependency('rake')
  gemspec.files.concat Dir["vendor/plugins/**/*"]
end
