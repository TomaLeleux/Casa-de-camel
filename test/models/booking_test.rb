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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
