# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{moneyrail}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yutaka HARA"]
  s.date = %q{2009-09-30}
  s.description = %q{Household account book, written in Rails}
  s.email = %q{yutaka.hara/at/gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     ".gitmodules",
     "HISTORY",
     "README",
     "Rakefile",
     "VERSION",
     "app/controllers/accounts_controller.rb",
     "app/controllers/application_controller.rb",
     "app/controllers/categories_controller.rb",
     "app/controllers/home_controller.rb",
     "app/controllers/items_controller.rb",
     "app/controllers/logs_controller.rb",
     "app/controllers/stats_controller.rb",
     "app/helpers/accounts_helper.rb",
     "app/helpers/application_helper.rb",
     "app/helpers/categories_helper.rb",
     "app/helpers/home_helper.rb",
     "app/helpers/items_helper.rb",
     "app/helpers/logs_helper.rb",
     "app/models/account.rb",
     "app/models/category.rb",
     "app/models/expense.rb",
     "app/models/income.rb",
     "app/models/item.rb",
     "app/models/move.rb",
     "app/models/simple_item.rb",
     "app/views/accounts/edit.html.erb",
     "app/views/accounts/index.html.erb",
     "app/views/accounts/new.html.erb",
     "app/views/accounts/show.html.erb",
     "app/views/categories/edit.html.erb",
     "app/views/categories/index.html.erb",
     "app/views/categories/new.html.erb",
     "app/views/categories/show.html.erb",
     "app/views/home/index.html.erb",
     "app/views/items/edit.html.erb",
     "app/views/items/index.html.erb",
     "app/views/items/new.html.erb",
     "app/views/items/show.html.erb",
     "app/views/layouts/application.html.erb",
     "app/views/logs/view.html.erb",
     "app/views/stats/show.html.erb",
     "config/boot.rb",
     "config/database.yml",
     "config/environment.rb",
     "config/environments/cucumber.rb",
     "config/environments/development.rb",
     "config/environments/production.rb",
     "config/environments/test.rb",
     "config/initializers/backtrace_silencers.rb",
     "config/initializers/inflections.rb",
     "config/initializers/mime_types.rb",
     "config/initializers/new_rails_defaults.rb",
     "config/initializers/session_store.rb",
     "config/locales/en.yml",
     "config/routes.rb",
     "db/migrate/20090802070406_create_accounts.rb",
     "db/migrate/20090802073601_create_categories.rb",
     "db/migrate/20090804065900_create_items.rb",
     "db/production.sqlite3",
     "doc/README_FOR_APP",
     "features/step_definitions/webrat_steps.rb",
     "features/support/env.rb",
     "features/support/paths.rb",
     "lib/tasks/cucumber.rake",
     "lib/tasks/rspec.rake",
     "main.rb",
     "moneyrail.gemspec",
     "public/404.html",
     "public/422.html",
     "public/500.html",
     "public/favicon.ico",
     "public/images/rails.png",
     "public/javascripts/application.js",
     "public/javascripts/controls.js",
     "public/javascripts/dragdrop.js",
     "public/javascripts/editor.js",
     "public/javascripts/effects.js",
     "public/javascripts/jquery-ui.js",
     "public/javascripts/jquery.js",
     "public/javascripts/prototype.js",
     "public/robots.txt",
     "public/stylesheets/editor.less",
     "public/stylesheets/scaffold.css",
     "script/about",
     "script/autospec",
     "script/console",
     "script/cucumber",
     "script/dbconsole",
     "script/destroy",
     "script/generate",
     "script/performance/benchmarker",
     "script/performance/profiler",
     "script/plugin",
     "script/runner",
     "script/server",
     "script/spec",
     "script/spec_server",
     "spec/_fixtures/accounts.yml",
     "spec/_fixtures/categories.yml",
     "spec/_fixtures/incomes.yml",
     "spec/_fixtures/items.yml",
     "spec/fixtures/accounts.yml",
     "spec/fixtures/categories.yml",
     "spec/fixtures/items.yml",
     "spec/helpers/accounts_helper_spec.rb",
     "spec/helpers/categories_helper_spec.rb",
     "spec/helpers/items_helper_spec.rb",
     "spec/models/account_spec.rb",
     "spec/models/category_spec.rb",
     "spec/models/income_spec.rb",
     "spec/models/item_spec.rb",
     "spec/rcov.opts",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "vendor/plugins/acts_as_list/README",
     "vendor/plugins/acts_as_list/init.rb",
     "vendor/plugins/acts_as_list/lib/active_record/acts/list.rb",
     "vendor/plugins/acts_as_list/test/list_test.rb",
     "vendor/plugins/less/LICENCE",
     "vendor/plugins/less/README",
     "vendor/plugins/less/init.rb",
     "vendor/plugins/less/lib/less_for_rails.rb",
     "vendor/plugins/less/test/less_for_rails_test.rb"
  ]
  s.homepage = %q{http://github.com/yhara/moneyrail}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Household account book, written in Rails}
  s.test_files = [
    "spec/helpers/accounts_helper_spec.rb",
     "spec/helpers/categories_helper_spec.rb",
     "spec/helpers/items_helper_spec.rb",
     "spec/models/account_spec.rb",
     "spec/models/category_spec.rb",
     "spec/models/income_spec.rb",
     "spec/models/item_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 2.3.4"])
      s.add_runtime_dependency(%q<ruby-station-runtime>, [">= 0.0.2"])
    else
      s.add_dependency(%q<rails>, ["= 2.3.4"])
      s.add_dependency(%q<ruby-station-runtime>, [">= 0.0.2"])
    end
  else
    s.add_dependency(%q<rails>, ["= 2.3.4"])
    s.add_dependency(%q<ruby-station-runtime>, [">= 0.0.2"])
  end
end
