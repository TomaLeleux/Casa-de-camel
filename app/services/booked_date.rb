class BookedDate
  def initialize(start_date,end_date)
    @start_date = start_date
    @end_date = end_date
    @range_date = []
  end

  def set_range
    array = []
    actual_date = @start_date
    while actual_date <= @end_date
      format_date = Date.parse(actual_date.to_s)
      y = format_date.year
      m = format_date.month
      d = format_date.day
      if d.to_s.length == 1
        d = "0#{d}"
      end
      if m.to_s.length == 1
        m = "0#{m}"
      end
      @range_date << "#{d}/#{m}/#{y}"
      actual_date += 1
    end
    # array << @range_date.join(",")
    @range_date
  end
end
