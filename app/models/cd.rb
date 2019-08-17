class Cd < ApplicationRecord

	has_many :songs, dependent: :destroy
	belongs_to :product

end
