class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :user_information, dependent: :destroy, inverse_of: :user
  has_one :user_address, dependent: :destroy, inverse_of: :user
  has_one :user_card, dependent: :destroy, inverse_of: :user

  accepts_nested_attributes_for :user_information
  accepts_nested_attributes_for :user_address
  accepts_nested_attributes_for :user_card
end
