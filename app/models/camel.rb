# == Schema Information
#
# Table name: camels
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  localisation     :string
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
#

class Camel < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
