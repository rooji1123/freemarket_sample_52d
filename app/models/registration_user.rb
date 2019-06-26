class RegistrationUser
  include ActiveModel::Model
  belongs_to :user
  
  attr_accessor :nickname, :email

  validates :nickname, presence: {message: "入力してください"}
  validates :email, assosiated: true
end