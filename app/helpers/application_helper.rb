# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_date(d)
    d.strftime("%Y-%m-%d (%a)")
  end

  def format_month(d)
    d.strftime("%Y-%m")
  end

  # (str, date) or (date)
  def link_to_edit_logs(a, b=nil)
    str, date = str_and_date(a, b)

    link_to str, edit_logs_path(:year => date.year, :month => date.month)
  end

  def link_to_show_logs(a, b=nil)
    str, date = str_and_date(a, b)

    link_to str, show_logs_path(:year => date.year, :month => date.month)
  end

  def link_to_show_stats(a, b=nil)
    str, date = str_and_date(a, b)

    link_to str, show_stats_path(:year => date.year, :month => date.month)
  end

  private

  def str_and_date(a, b)
    if b 
      [a, b]
    else
      [format_month(a), a]
    end
  end


end
