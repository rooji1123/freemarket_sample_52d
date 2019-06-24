class RegistrationUser
  include ActiveModel::Model
  belongs_to :users
  
  attr_accessor :nickname, :email

  validates :nickname, presence: {message: "入力してください"}
  validates :email, assosiated: true
end