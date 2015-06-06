class Scout < ActiveRecord::Base

  # Associations
  belongs_to :team
  belongs_to :address
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :character_traits
  has_and_belongs_to_many :parents, class_name: "RelatedPerson", 
    join_table: "scouts_parents", association_foreign_key: "parent_id"
    
  # Enums
  enum rank: %i(youngster scout pioneer eagle_scout scout_of_the_republic )
  enum position: %i(private songster chronicler photographer pennant_bearer
  patrol_leader adjutant)
end
