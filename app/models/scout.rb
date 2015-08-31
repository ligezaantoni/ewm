class Scout < ActiveRecord::Base

  pesel_attr :pesel

  # Associations
  belongs_to :team
  belongs_to :school
  has_one :address, as: :addressable, dependent: :destroy
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :character_traits
  has_many :parents, as: :relatable, class_name: "RelatedPerson"
  has_many :tasks, as: :taskable
  
  has_attached_file :avatar, :styles => { :medium => "400x500>" }
  
  accepts_nested_attributes_for :address
  
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/ }, allow_blank: true
  validates :pesel, pesel: true
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
  # Enums
  enum rank: %i(youngster scout pioneer eagle_scout scout_of_the_republic )
  enum position: %i(no_position songster chronicler photographer pennant_bearer
  patrol_leader adjutant)
  
  def born_on
    @born_on ||= pesel_personal_data.date_of_birth rescue nil
  end
  
  def age
    if born_on.present?
      now = Time.now.utc.to_date
      years = now.year - born_on.year
      @age ||= years - (born_on.years_since(years) > now ? 1 : 0)
    end
  end
  
end
