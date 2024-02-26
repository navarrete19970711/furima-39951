class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  with_options presence: true do

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヴー]+\z/u, message: 'は全角カタカナを使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
    end
    
    validates :password, { format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字の混合である必要があります' } }
    validates :nickname
    validates :birth_date
  end
  has_many :items
  has_many :purchases
end
