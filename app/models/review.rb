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

class Review < ApplicationRecord
  belongs_to :camel
  validates :content, presence: true, length: { minimum: 20 }
  validates :rating, presence: true, inclusion: { in: (0..5) }, numericality: { only_integer: true }

end
