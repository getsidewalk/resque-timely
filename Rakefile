require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.pattern = "test/**/*_spec.rb"
end

task :default => :test