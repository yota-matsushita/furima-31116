class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :lastname, 
  format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}, 
  presence: true
  validates :firstname, 
  format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}, 
  presence: true
  validates :lastname_kana, 
  format: { with: /\A([ァ-ン]|ー)+\z/}, 
  presence: true
  validates :firstname_kana, 
  format: { with: /\A([ァ-ン]|ー)+\z/}, 
  presence: true
  validates :birthday, presence: true
end
