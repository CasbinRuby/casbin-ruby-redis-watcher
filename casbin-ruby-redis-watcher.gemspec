# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'casbin-ruby-redis-watcher/version'

Gem::Specification.new do |s|
  s.name        = 'casbin-ruby-redis-watcher'
  s.version     = CasbinWatcher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Igor Kutyavin']
  s.email       = ['konayre@evrone.com']
  s.homepage    = 'https://github.com/evrone/casbin-ruby-redis-watcher'
  s.licenses    = ['Apache License 2.0']
  s.description = 'Redis watcher adapter for Ruby'
  s.summary     = 'Redis watcher in Ruby'
  s.required_ruby_version = '>= 2.5.0'

  s.add_dependency 'redis'

  s.add_development_dependency 'rspec', '~> 3.10'
  s.add_development_dependency 'rubocop', '>= 1.8'
  s.add_development_dependency 'rubocop-rspec'
end
