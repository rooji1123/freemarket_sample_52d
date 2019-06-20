class UserAddress < ApplicationRecord
  belongs_to :user, inverse_of: :user_address
end
