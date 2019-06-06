require "graphql"
require "./app/models/document"
require_relative "types/document"

class QueryType < GraphQL::Schema::Object
  field :documents, [Types::Document], null: false

  def documents(start = 0, offset = 5)
    Document.all(start, offset)
  end
end
