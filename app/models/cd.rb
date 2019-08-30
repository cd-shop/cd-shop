class Cd < ApplicationRecord
	belongs_to :product

	has_many :songs, dependent: :destroy

	validates :cdname, presence: true

	accepts_nested_attributes_for :songs, allow_destroy: true

end
