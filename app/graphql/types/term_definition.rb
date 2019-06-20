class Types::Definition < Types::BaseObject
  field :p, String, null: true
end

def p
  join_paragraphs(object["p"])
end
