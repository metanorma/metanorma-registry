class Types::Date < Types::BaseObject
  field :type, String, null: true
  field :on, String, null: true
  field :from, String, null: true
  field :to, String, null: true
end
