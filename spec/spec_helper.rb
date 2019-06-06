require "rack/test"
require "rspec"

ENV["RACK_ENV"] = "test"

require File.expand_path "../../app/app.rb", __FILE__
Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

module RSpecMixin
  include Rack::Test::Methods

  def app
    MetanormaRegistry
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include Metanorma::StubHelper
end
