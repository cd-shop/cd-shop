class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
          validates :tellnumber, presence: true, format: { with: VALID_PHONE_REGEX }
          
end