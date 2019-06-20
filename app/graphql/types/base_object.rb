require "graphql"

module Types
  class BaseObject < GraphQL::Schema::Object
    private

    def ensure_array_type(data)
      data.is_a?(Array) ? data : [data]
    end

    def join_paragraphs(paragraphs, connector = "\n")
      paragraphs = paragraphs
      paragraphs.is_a?(Array) ? paragraphs.join(connector).to_s : nil
    end
  end
end
