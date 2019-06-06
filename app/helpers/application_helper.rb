module ApplicationHelper
  def timezoned(time)
    return time.in_time_zone("Brasilia").strftime("%d/%m/%Y - %R")
  end
end
