require "graphql"
require "./app/models/document"
require_relative "types/document"

class QueryType < GraphQL::Schema::Object
  field :documents, [Types::Document], null: false do
    description "Find a documents by type"
    argument :type, String, required: false

    description "Start position for lookup"
    argument :start, Integer, required: false

    description "Number of documents o returns"
    argument :limit, Integer, required: false
  end

  def documents(type: nil, start: 0, limit: 5)
    Document.all(type, start, limit)
  end
end
