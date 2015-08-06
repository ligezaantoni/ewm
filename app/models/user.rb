class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable
  
  # Enums
  enum role: %i(scoutmaster admin)
end
