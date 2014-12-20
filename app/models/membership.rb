class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  # belongs_to :role

  validates :user_id, presence: true
  validate :user_id_uniqueness_to_project

  def user_id_uniqueness_to_project
    if :user_id.present? && Membership.where(project_id: project_id, user_id: user_id).count > 0
      errors.add(:user_id, "already a member of this project")
    end
  end
end
