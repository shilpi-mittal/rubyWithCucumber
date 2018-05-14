require 'cucumber'
require 'cucumber/rake/task'
begin
  require 'rspec/core/rake_task'

  namespace :test do
    task :default => :automation

    desc "Runs all selenium automation tests"
    RSpec::Core::RakeTask.new(:run_tests) do |t|
      t.pattern = './testModule/test/features/*_spec.rb'
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

rescue LoadError
  # Ignore
end


# require 'cucumber/rake/task'
#
# require 'rdoc/task'
#
# desc 'generate API documentation to doc/rdocs/index.html'
#
# RDoc::Task.new do |rd|
#   rd.rdoc_dir = 'doc/rdocs'
#   rd.options << '–all'
#   rd.options << '–inline-source'
#   rd.options << '–line-numbers'
#   rd.options << '–all'
#   rd.options << '–fileboxes'
#   rd.options << '–diagram'
# end
#
# Cucumber::Rake::Task.new :features do |t|
#
#   t.cucumber_opts = [
#       "*/*.feature",
#       #                       '--tags', '~@smoke', # Exclude tests with @smoke tag
#       '--tags', '@smoke,@wip',
#       "--format progress -o log/features.log",
#       "--format junit -o log/",
#       "--format html -o log/features.html",
#       "--format pretty" ]
#   t.fork=true
#
# end