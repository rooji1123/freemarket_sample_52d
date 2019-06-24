class UserCard < ApplicationRecord
  belongs_to :user, inverse_of: :user_card

  validates :card_number, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :security_code, presence: true
end
