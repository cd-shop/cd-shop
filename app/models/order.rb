class Order < ApplicationRecord
	belongs_to :user

	has_many :order_histories
	accepts_nested_attributes_for :order_histories
end
