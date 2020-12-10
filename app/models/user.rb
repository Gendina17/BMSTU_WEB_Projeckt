class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true,  length: { maximum: 18 }
  validates :password, confirmation: true, length: { minimum: 6 }

  def self.authenticate(email, submitted_password)
    user = find_by(email: email)
    return nil if user.nil?
    return user if user.authenticate(submitted_password)
  end
end
