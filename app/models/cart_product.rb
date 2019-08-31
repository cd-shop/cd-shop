class CartProduct < ApplicationRecord
    
    belongs_to :user
    belongs_to :product
    validates :product, presence: true, uniqueness: { scope: :user_id }
    
end

