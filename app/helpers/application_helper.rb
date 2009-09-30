# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date(d)
    d.strftime("%Y-%m-%d (%a)")
  end
end
