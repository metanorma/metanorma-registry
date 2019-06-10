require_relative "clause"

class Types::Section < Types::BaseObject
  field :clause, [Types::Clause], null: true

  def clause
    clauses = object["clause"]
    clauses.is_a?(Array) ? clauses : [clauses]
  end
end
