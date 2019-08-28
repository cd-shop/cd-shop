class OrderHistory < ApplicationRecord
    belongs_to :order
	enum shipment_status: {発送準備中: 0, 発送済: 1, 到着済み: 2}
end
