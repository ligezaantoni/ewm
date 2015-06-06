class Team < ActiveRecord::Base
  belongs_to :address
  has_many :scouts
  has_many :schools
  has_many :events
end
