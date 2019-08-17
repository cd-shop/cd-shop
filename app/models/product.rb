class Product < ApplicationRecord

	has_many :cds, dependent: :destroy

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

end
