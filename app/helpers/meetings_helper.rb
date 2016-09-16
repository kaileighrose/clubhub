module MeetingsHelper
  def format_date(datetime)
    datetime.strftime("%D")
  end

  def format_time(datetime)
    datetime.strftime("%I:%M %p")
  end

  def future_meetings(meetings)
    meetings.where("time > ?", Time.now)
  end
end
