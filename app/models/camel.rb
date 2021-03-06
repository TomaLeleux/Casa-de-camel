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

class Camel < ApplicationRecord
  include PgSearch

  belongs_to :user
  has_many :bookings
  has_many :reviews
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true, uniqueness: { scope: :user_id, message: 'should not have multiple camels with the same name' }
  validates :country, presence: true, allow_blank: false
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :address, presence: true

  pg_search_scope :global_search,
    against: [ :name, :country, :address ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
