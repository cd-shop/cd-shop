class Product < ApplicationRecord
	def quantity
        cart_quantity = []
		self.stock_number.times do |i|
			cart_quantity += [i+1]
		end
        return cart_quantity
	end

	def self.search(search) #self.はProduct.を意味する
		if search
		  where(['productname LIKE ?', "%#{search}%"]) #検索とproductnameの部分一致を表示。
		else
		  Product.all #全て表示させる
	   end
	end


	has_many :cds, dependent: :destroy
	has_many :cart_products, dependent: :destroy
	has_many :order_histories

	validates :productname, presence: true
	validates :price, presence: true

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	attachment :image
	paginates_per 10

	accepts_nested_attributes_for :cds, allow_destroy: true
	accepts_nested_attributes_for :cart_products

	#enum
	
end
