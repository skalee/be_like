# copied from https://github.com/rspec/rspec-expectations/blob/master/features/support/env.rb
require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 3
end
