class Types::Foreword < Types::BaseObject
  field :p, String, null: true
  field :title, String, null: true
  field :obligation, String, null: true

  def p
    join_paragraphs(object["p"])
  end
end
