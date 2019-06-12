require_relative "clause"

class Types::Section < Types::BaseObject
  field :clause, [Types::Clause], null: true

  def clause
    ensure_array_type(object["clause"])
  end
end
