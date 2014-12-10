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

  def tasks_filter_params(sort_hash)
    return_hash = {
      filter_completed: params[:filter_completed],
      direction: params[:direction],
      order_by: params[:order_by],
    }

    if sort_hash[:order_by] == return_hash[:order_by]
      if return_hash[:direction] == "asc"
        direction = "desc"
      else
        direction = "asc"
      end
    end

    return_hash.merge(sort_hash).merge({direction: direction})
  end
end
