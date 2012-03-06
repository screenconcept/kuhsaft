# encoding: UTF-8
#
require 'rubygems'

begin
  require 'bundler'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core/rake_task'
require 'rake'

Bundler::GemHelper.install_tasks

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  # t.rspec_opts = %w(--colour --fail-fast --format nested)
  t.rspec_opts = %w(--colour  --format nested)
  t.ruby_opts  = %w(-w)
end

task :default => :spec
