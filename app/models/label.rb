class Label < ApplicationRecord
	validates :labelname, presence: true
	has_many :products
	accepts_nested_attributes_for :products
end
