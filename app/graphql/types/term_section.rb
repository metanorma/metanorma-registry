require_relative "term"

# "terms": "{\"id\"=>\"_terms_and_definitions\", \"obligation\"=>\"normative\", \"title\"=>\"Terms and definitions\", \"term\"=>[{\"id\"=>\"term-std-project\", \"preferred\"=>\"standardization project\", \"definition\"=>{\"p\"=>\"an organized process with one or more  ()     \\nthat contributes towards a defined scope of work\"}}

class Types::TermSection < Types::BaseObject
  field :id, String, null: true
  field :obligation, String, null: true
  field :title, String, null: true
  field :term, [Types::Term], null: true
end

def term
  ensure_array_type(object["term"])
end
