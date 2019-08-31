class Song < ApplicationRecord
	belongs_to :cd
	validates :songname, presence: true

end
