module ApplicationHelper

  def upcomming(task)

    week_from_now = (Date.today + 7)
    danger = false
    if task.completed == false && !task.due_date.nil?
      if week_from_now > task.due_date
        return true
      end
    end
  end
end
