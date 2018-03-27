class Checkout < ApplicationRecord
	validates :street, :town, :county, :country, presence: true
	has_one :user
	has_one :order
end

