class Event < ActiveRecord::Base
  belongs_to :team
  has_many :activities
end
