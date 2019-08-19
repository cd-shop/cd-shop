class Cd < ApplicationRecord

	has_many :songs, dependent: :destroy
	accepts_nested_attributes_for :songs
	belongs_to :product

end
