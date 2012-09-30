require 'bundler'
require 'rake/clean'
#require 'rdoc/task'
require 'rspec/core/rake_task'

include Rake::DSL

Bundler::GemHelper.install_tasks

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  # t.rspec_opts = %w(--colour --fail-fast --format nested)
  t.rspec_opts = %w(--colour  --format nested)
  t.ruby_opts  = %w(-w)
end

task :default => [:spec]
