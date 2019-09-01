class OrderHistory < ApplicationRecord
    belongs_to :order

    belongs_to :product
    enum shipment_status: {発送準備中: 0, 発送済: 1, 到着済み: 2}

    def toggle_status!
        if "発送準備中"
            "発送済"
        elsif  "発送済"
            "到着済"
        else
            "到着済"
        end
    end
end
