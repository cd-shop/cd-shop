class Product < ApplicationRecord

	has_many :cds, dependent: :destroy

	belongs_to :artist

end
