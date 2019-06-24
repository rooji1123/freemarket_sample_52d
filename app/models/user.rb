class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_information, dependent: :destroy
  has_one :user_address, dependent: :destroy
  has_one :user_card, dependent: :destroy

  accepts_nested_attributes_for :user_information
  accepts_nested_attributes_for :user_address
  accepts_nested_attributes_for :user_card

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
