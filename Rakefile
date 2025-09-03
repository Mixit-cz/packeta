require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task 'release:rubygem_push' do
  puts 'Skipping gem push (internal gem).'
end
