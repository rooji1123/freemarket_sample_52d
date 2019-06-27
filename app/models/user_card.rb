class UserCard < ApplicationRecord
  belongs_to :user, inverse_of: :user_card

  # validates :card_number, presence: true, format: { with: /\A\d{16}\Z/}
  # validates :expiration_month, presence: true
  # validates :expiration_year, presence: true
  # validates :security_code, presence: true, format: { with: /\A\d{3,4}\Z/}
end
