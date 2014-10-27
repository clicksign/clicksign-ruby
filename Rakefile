require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :console do
  require 'irb'
  require 'irb/completion'
  require 'clicksign'
  ARGV.clear
  IRB.start
end

task :default => :spec
task :test => :spec
