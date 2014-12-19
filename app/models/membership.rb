class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  # belongs_to :role

  validates :user_id, presence: true
end
