class Listing < ApplicationRecord
	has_attached_file :image, styles: { medium: "200x>", thumb: "500x500>" }, default_url: "default.jpg"
	#has_attached_file :resize_to_fit => [500,500]
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :title, :artist, :category, :description, :price, presence: true
	validates :price, numericality: {greater_than: 0}
	validates_attachment_presence :image

	belongs_to :user
	belongs_to :category
	has_many :reviews, dependent: :destroy
	has_many :order_items
end
