require "graphql"
require_relative "base_object"
require_relative "contributor"
require_relative "copyright"
require_relative "date"
require_relative "document_version"
require_relative "editorial_group"

class Types::BibData < Types::BaseObject
  field :type, String, null: false
  field :title, String, null: true
  field :docidentifier, String, null: true
  field :docnumber, String, null: true
  field :date, Types::Date, null: true
  field :contributor, [Types::Contributor], null: true
  field :edition, String, null: true
  field :version, Types::DocumentVersion, null: true
  field :language, String, null: true
  field :script, String, null: true
  field :status, String, null: true
  field :copyright, Types::Copyright, null: true
  field :editorialgroup, Types::EditorialGroup, null: true

  def contributor
    ensure_array_type(object["contributor"])
  end
end
