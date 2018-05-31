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
      @range_date << "#{d}/#{m}/#{y}"
      actual_date += 1
    end
    array << @range_date.join(",")
  end
end
