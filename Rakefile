# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rake/testtask'

# task :default => [:test]
# Rake::TestTask.new(:test) do |test|
#   test.libs << 'test'
#
#   # ensure the sample test file is included here
#   test.test_files = FileList['test/test_*.rb']
#
#   test.verbose = true
# end


  require 'rspec/core/rake_task'

  namespace :test do
    task :default => :automation

    desc "Runs all selenium automation tests"
    RSpec::Core::RakeTask.new(:run_tests) do |t|
      t.pattern = './testModule/test/features/*.feature'
      t.rspec_opts = "--colour "
      t.rspec_opts << "--format progress "
      #t.rspec_opts << "--format html > test/automation_report.html "
      t.verbose = true
    end

    task :automation => ["environment"] do
      begin
        env = ENV["RAILS_ENV"]
        Rake::Task["test:run_tests"].invoke
      rescue => e
        raise e
      end
    end
  end