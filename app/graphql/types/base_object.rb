require "graphql"

module Types
  class BaseObject < GraphQL::Schema::Object
    private

    def ensure_array_type(data)
      data.is_a?(Array) ? data : [data]
    end
  end
end
