class Product < ApplicationRecord

	has_many :cds, dependent: :destroy
	accepts_nested_attributes_for :cds

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	attachment :image

	#enum
	enum sale_status: {販売中: 0, 品切: 1}
end
