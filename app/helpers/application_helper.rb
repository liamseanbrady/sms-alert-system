module ApplicationHelper
  def friendly_datetime(dt)
    dt = dt.strftime("%a %e %b %Y") 
  end
end
