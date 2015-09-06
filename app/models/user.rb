class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  
  after_create :create_profile
  
  #Associations
  has_many :teams
  has_one :profile
  
  # Enums
  enum role: %i(scoutmaster admin)
  
  private
  
  def create_profile
    build_profile
    save
  end
  
end
