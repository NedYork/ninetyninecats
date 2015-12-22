class Cat < ActiveRecord::Base
  validates :birth_date, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(brown red black yellow white) }
  validates :sex, inclusion: { in: %w(M F) }
  
  def age
    dob = birth_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
