class UserInformation < ApplicationRecord
  belongs_to :user, inverse_of: :user_information
end
