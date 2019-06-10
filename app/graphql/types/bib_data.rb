require "graphql"
require_relative "base_object"

class Types::BibData < Types::BaseObject
  field :type, String, null: false
  field :title, String, null: true
  field :docidentifier, String, null: true
  field :docnumber, String, null: true
  field :date, String, null: true
  field :contributor, String, null: true
  field :edition, String, null: true
  field :version, String, null: true
  field :language, String, null: true
  field :script, String, null: true
  field :status, String, null: true
  field :copyright, String, null: true
  field :editorialgroup, String, null: true
end
