# == Schema Information
#
# Table name: bookings
#
#  id         :bigint(8)        not null, primary key
#  date_start :date
#  date_end   :date
#  user_id    :bigint(8)
#  camel_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("pending")
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel

  validates :status, presence: true, inclusion: { in: ['pending', 'validated', 'declined', 'completed'] }
  validates :date_start, presence: true, allow_blank: false
  validates :date_end, presence: true, allow_blank: false
  validates :user_id, presence: true
  validates :camel_id, presence: true
  validate  :end_date_after_start_date
  validate  :start_date_after_today
  validate  :no_booking_in_booking

  def end_date_after_start_date
    if date_start.present? && date_end.present? && date_end < date_start
      errors.add(:date_end, "can't be before the start date")
    end
  end

  def start_date_after_today
    if date_start.present? && date_start < Date.today
      errors.add(:date_start, "can't be in the past")
    end
  end

  def no_booking_in_booking
    dates = BookedDate.new(date_start, date_end).set_range
    bookings = Booking.where(camel: camel)
    bookings.each do |booking|
      dates_booked = BookedDate.new(booking.date_start, booking.date_end).set_range
      if is_included?(dates, dates_booked) && errors[:base].empty?
        errors.add(:base, "Can't book if the camel is booked during this period")
      end
    end
  end

  private

  def is_included?(to_check, target)
    target.each do |string|
      return true if to_check.include? string
    end
    false
  end
end
