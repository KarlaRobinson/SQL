class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 

  validates :email, :uniqueness => true
  validates :email, :format=> { :with => /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/}
  validates :phone, :format => { :with => /\d/}
  validates :phone, :length => { :minimum => 10 }

  validate :of_age
 
  def of_age
    if Date.today.year - birthday.year < 21
      errors.add(:birthday, "User too young.")
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
   Date.today.year - birthday.year
  end

end

# $ rspec spec/user_spec.rb -e "#name and #age"
# $ rspec spec/user_spec.rb -e "validations"
# $ rspec spec/user_spec.rb -e "advanced validations"