class Listing < ApplicationRecord
	has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :title, :artist, :version, :description, :price, presence: true
	validates :price, numericality: {greater_than: 0}
	validates_attachment_presence :image

	belongs_to :user
	has_many :reviews, dependent: :destroy
	has_many :orders
	has_many :order_items	
end
