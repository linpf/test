class Profile < ActiveRecord::Base

  belongs_to :user

  validate :exist_first_name_or_last_name, :sue_is_not_male

  validates :gender, inclusion: { in: %w(male female),  
      message: "%{value} is not a valid gender" }

  def exist_first_name_or_last_name 
    if first_name == nil and last_name == nil 
      errors.add(:first_name,"blank")
      errors.add(:last_name,"blank")
    end
  end
  def sue_is_not_male
    if first_name == "Sue" and gender == "male" 
      errors.add(:gender,"error!")
    end
  end 

  def self.get_all_profiles min_year , max_year 

    self.where("birth_year between :min_year and :max_year ", min_year:min_year, max_year:max_year).order(:birth_year)

  end

end
