class Label < ApplicationRecord

	has_many :products, dependet: :destroy
end
