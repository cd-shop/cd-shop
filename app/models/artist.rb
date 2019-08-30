class Artist < ApplicationRecord
	validates :artistname, presence: true
	has_many :products
	accepts_nested_attributes_for :products
end
