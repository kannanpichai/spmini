module ApplicationHelper

  DISPLAY_DATE_TIME_FORMAT = "%d %B, %Y / %I:%M %p  %Z"

  def format_dt(dt, format=nil)
    if format
      return dt.strftime(format)
    end
    return dt.strftime(DISPLAY_DATE_TIME_FORMAT)
  end

end
