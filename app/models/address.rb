class Address < ActiveRecord::Base
  has_many :scouts
  has_many :teams
  has_many :schools
end
