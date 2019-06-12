require_relative "term_definition"

class Types::Term < Types::BaseObject
  field :id, String, null: false
  field :obligation, String, null: true
  field :title, String, null: true
  field :preferred, String, null: true
  field :definition, Types::Definition, null: true
end

