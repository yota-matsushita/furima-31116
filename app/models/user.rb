class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :encrypted_password,
            format: { with: /\A[a-zA-Z0-9]+\z/ },
            presence: true, uniqueness: true
  validates :nickname, presence: true
  with_options format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true do
    validates :lastname
    validates :firstname
  end
  with_options format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true do
    validates :lastname_kana
    validates :firstname_kana
  end
  validates :birthday, presence: true
end
