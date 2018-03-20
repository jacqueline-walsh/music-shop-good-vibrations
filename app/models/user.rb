class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	validates :first_name, :last_name, :date_of_birth, presence: true 
 	has_many :listings, dependent: :destroy
 	has_many :reviews, dependent: :destroy
 	#has_many :sales, class_name: "Order", foreign_key: "seller_id"
 	has_many :purchases, class_name: "Order", foreign_key: "buyer_id"
 	has_many :messages
	has_many :comments
end
