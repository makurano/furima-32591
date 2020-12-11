class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        with_options presence: true do
          #半角英数字混合
          validates :email,               format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
          #@マーク必須の正規表現?
          validates :encrypted_password
          validates :nickname
          #全角での入力「あ〜漢字」正規表現
          validates :last_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
          #全角カタカナの正規表現
          validates :last_name_katakana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
          #全角での入力「あ〜漢字」正規表現
          validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
          #全角カタカナの正規表現
          validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :birthday
        end
end
