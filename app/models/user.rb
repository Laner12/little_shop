class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, email: { strict_mode: true }
  validates :state, length: { is: 2 }
  validates :zip_code, length: { is: 5 }

  enum role: %w(default admin)

  def date_registered
    created_at.strftime("%m/%d/%Y")
  end
end
