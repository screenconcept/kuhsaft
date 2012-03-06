#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  # t.rspec_opts = %w(--colour --fail-fast --format nested)
  t.rspec_opts = %w(--colour  --format nested)
  t.ruby_opts  = %w(-w)
end

task :default => :spec
