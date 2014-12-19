class User < ActiveRecord::Base
  has_many :memberships
  has_many :projects, through: :memberships

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
