class RelatedPerson < ActiveRecord::Base
  has_and_belongs_to_many :schools, foreign_key: "official_id",
    join_table: "schools_officials"
  has_and_belongs_to_many :scouts, foreign_key: "parent_id",
    join_table: "scouts_parents"
end
