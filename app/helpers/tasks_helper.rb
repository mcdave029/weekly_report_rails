module TasksHelper
  def prettify(date)
    return if date.blank?

    date.strftime('%b %d, %Y %I:%M %p')
  end

  def status_color(task)
    return "success" if task.done?
    return "danger" if task.pending?
    return "warning" if task.on_going?
    return "info" if task.on_qa?
  end
end
