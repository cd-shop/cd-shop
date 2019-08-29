class OrderHistory < ApplicationRecord
    belongs_to :order

    belongs_to :product
    enum shipment_status: {発送準備中: 0, 発送済: 1, 到着済み: 2}
    # enum pay_select: {クレジットカード払い: 0, 銀行払い: 1, コンビニ払い: 2 }
end
