# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  rating     :integer
#  camel_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
