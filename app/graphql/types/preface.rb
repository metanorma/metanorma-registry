require_relative "foreword"
require_relative "introduction"

class Types::Preface < Types::BaseObject
  field :foreword, Types::Foreword, null: true
  field :introduction, Types::Introduction, null: true
end
