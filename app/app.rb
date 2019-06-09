require "active_support"
require "active_support/core_ext/hash"

require "sinatra"
require "sinatra/json"
require "rack/contrib"

require_relative "graphql/schema"

class MetanormaRegistry < Sinatra::Base
  use Rack::PostBodyContentTypeParser

  get "/" do
    "Welcome to the metanorma Registry! \n" \
      "Please check the documentation for the GraphQl API"
  end

  post "/graphql" do
    json(execute_graphql_schema(params))
  end

  def self.root
    File.dirname(__dir__)
  end

  def self.root_path
    Pathname.new(MetanormaRegistry.root)
  end

  def self.data_path
    MetanormaRegistry.root_path.join("data")
  end

  private

  def execute_graphql_schema(data)
    context = {}
    query = data["query"]
    variables = data["variables"] || {}

    MetanormaRegistrySchema.execute(query, variables: variables, context: context)
  end
end 
