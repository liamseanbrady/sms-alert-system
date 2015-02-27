module ApplicationHelper
  def friendly_datetime(dt)
    dt = dt.strftime("%a %e %b %Y  (%H:%M %P)") 
  end

  def generate_filename
    clean_time = Time.now.strftime("%e_%b_%y")
    optional_prefix = current_user.branch? ? "#{current_user.username.gsub(/[^a-zA-Z0-9]/, '_').downcase}" : 'all_sites'
    "#{optional_prefix}_fire_safety_logs_#{clean_time}"
  end
end
