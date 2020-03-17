module TasksHelper
  def prettify(date)
    return if date.blank?

    date.strftime('%b %d, %Y %I:%M %p')
  end
end
