class Genre < ApplicationRecord
	validates :genrename,  presence: true
	has_many :products
	accepts_nested_attributes_for :products
end
