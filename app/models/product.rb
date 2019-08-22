class Product < ApplicationRecord

	has_many :cds, dependent: :destroy
	has_many :cart_products, dependent: :destroy

	belongs_to :artist
	belongs_to :genre
	belongs_to :label
	

	attachment :image
	paginates_per 10

	accepts_nested_attributes_for :genre
	accepts_nested_attributes_for :label
	accepts_nested_attributes_for :artist
	#enum
	enum sale_status: {販売中: 0, 品切: 1}
end
