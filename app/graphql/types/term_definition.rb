class Types::Definition < Types::BaseObject
  field :p, String, null: true
end

def p
  paragraph = object["p"]
  paragraph.is_a?(Array) ? paragraph.join("\n").to_s : nil
end
