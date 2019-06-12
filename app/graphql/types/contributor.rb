require_relative "organization"

class Types::Contributor < Types::BaseObject
  field :role, String, null: true
  field :organization, Types::Organization, null: true
end
