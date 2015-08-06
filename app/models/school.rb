class School < ActiveRecord::Base

  # Associations
  has_one :address, as: :addressable, dependent: :destroy
  belongs_to :team
  has_and_belongs_to_many :officials, class_name: "RelatedPerson",
    join_table: "schools_officials", association_foreign_key: "official_id"
  
  # Validations
  validates :name, presence: true
  
end
