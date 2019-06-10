class Types::Clause < Types::BaseObject
  field :p, String, null: true
  field :id, String, null: true
  field :ul, String, null: true
  field :title, String, null: true
  field :definitions, String, null: true
  field :obligation, String, null: true
  field :clause, [Types::Clause], null: true
  field :terms, String, null: true

  def p
    paragraph = object["p"]
    paragraph.is_a?(Array) ? paragraph.join("\n").to_s : nil
  end
end
