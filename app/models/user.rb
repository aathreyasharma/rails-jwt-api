class User < ApplicationRecord
  has_secure_password

  belongs_to :pincode
  has_many :tests
  validates_uniqueness_of :mobile

  def infect!
    self.infected = true
    self.save
  end
end
