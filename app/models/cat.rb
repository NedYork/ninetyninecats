class Cat < ActiveRecord::Base
  COAT_COLORS = %w(brown red black yellow white)
  GENDER = %w(M F)
  validates :birth_date, :name, :sex, presence: true
  validates :color, inclusion: { in: COAT_COLORS }
  validates :sex, inclusion: { in: GENDER }

  has_many :cat_rental_requests, :dependent => :destroy

  def age
    dob = birth_date
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
