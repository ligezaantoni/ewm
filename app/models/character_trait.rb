class CharacterTrait < ActiveRecord::Base
  has_and_belongs_to_many :educational_methods, join_table: "methods_traits"
  has_and_belongs_to_many :scouts
end
