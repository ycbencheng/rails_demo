class User < ApplicationRecord
  has_secure_password

  has_many :widgets, foreign_key: :seller_id

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  enum role: %i[buyer seller]
end
