# == Schema Information
#
# Table name: camels
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  country          :string
#  number_of_place  :integer
#  food_type        :string
#  color            :string
#  user_id          :bigint(8)
#  wifi             :boolean
#  chameaux_fiscaux :integer
#  vitesse_max      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  photo            :string
#  price_per_day    :integer
#  description      :text
#  latitude         :float
#  longitude        :float
#  address          :string
#  average          :float
#

require 'test_helper'

class CamelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
