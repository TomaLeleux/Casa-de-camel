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
end
