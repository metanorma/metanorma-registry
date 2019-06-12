require_relative "owner"

class Types::Copyright < Types::BaseObject
  field :from, String, null: true
  field :owner, Types::Owner, null: true

  def owner
    object[:owner]
  end
end
