class Review < ApplicationRecord
	belongs_to :user
	belongs_to :listing

  validates :rating, :comment, presence: true

end
