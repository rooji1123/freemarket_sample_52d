class UserCard < ApplicationRecord
  belongs_to :user, inverse_of: :user_card
end
