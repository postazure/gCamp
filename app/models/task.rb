class Task < ActiveRecord::Base
  belongs_to :project

  validates :description, presence: true
  validate :due_date_cannot_be_in_the_past, on: :create


  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "must be a future date.")
    end
  end
end
