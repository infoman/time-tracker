module ApplicationHelper
  ALERT_KEYS = {
    alert:  :danger,
    notice: :info
  }

  def alert_class(key)
    "alert alert-#{(ALERT_KEYS[key.to_sym] || key).to_s}"
  end

  def nav_active?(path)
    current_page?(path) ? 'active' : ''
  end
end
