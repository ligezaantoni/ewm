class RelatedPerson < ActiveRecord::Base

  # Associations
  has_and_belongs_to_many :schools, foreign_key: "official_id",
    join_table: "schools_officials"
  has_and_belongs_to_many :scouts, foreign_key: "parent_id",
    join_table: "scouts_parents"
  
  # Enums
  enum status: %i(educator father mother school_director school_representative)
end
