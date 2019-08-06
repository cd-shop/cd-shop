class User < ApplicationRecord
        # Include default devise modules. Others available are:
        # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
        devise :database_authenticatable, :registerable,
                :recoverable, :rememberable, :validatable

        has_many :addresses, dependent: :destroy

        validates :name, presence: true
        validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

        # カタカナの制御
        VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

        # 電話番号の制御
        validates :tellnumber, presence: true, format: { with: VALID_PHONE_REGEX }

        #退会処理の記述
        acts_as_paranoid
end