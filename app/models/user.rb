class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :email, uniqueness: true
  validates :password,
            format: { with: /\A[a-zA-Z0-9]+\z/ },
            presence: true
  with_options presence: true do
    validates :birthday
    validates :nickname
  end
  with_options format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true do
    validates :lastname
    validates :firstname
  end
  with_options format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true do
    validates :lastname_kana
    validates :firstname_kana
  end
end
