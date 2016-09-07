module MeetingsHelper
  def format_date(datetime)
    datetime.strftime("%D")
  end

  def format_time(datetime)
    datetime.strftime("%I:%M %p")
  end
end
