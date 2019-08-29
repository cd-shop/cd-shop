class Product < ApplicationRecord
	def quantity
        cart_quantity = []
		self.stock_number.times do |i|
			cart_quantity += [i+1]
		end
            return cart_quantity
   #ここにendいるかも？
	end
	
	def self.search(search) #self.はUser.を意味する
		if search
		  where(['productname LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
		else
		  Product.all #全て表示させる
	   end
	end


	has_many :cds, dependent: :destroy
	has_many :cart_products, dependent: :destroy
	has_many :order_histories

	belongs_to :artist
	belongs_to :genre
	belongs_to :label

	attachment :image
	paginates_per 10

	accepts_nested_attributes_for :cds, allow_destroy: true

	#enum
	enum sale_status: {販売中: 0, 品切: 1}
end
