require "graphql"
require_relative "query_type"

class MetanormaRegistrySchema < GraphQL::Schema
  query QueryType
end
