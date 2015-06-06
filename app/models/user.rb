class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  
  # Enums
  enum status: %i(scoutmaster admin)
end
