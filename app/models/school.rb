class School < ActiveRecord::Base

  # Associations
  belongs_to :address
  belongs_to :team
  has_and_belongs_to_many :officials, class_name: "RelatedPerson",
    join_table: "schools_officials", association_foreign_key: "official_id"
  
end
