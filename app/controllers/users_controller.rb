class UsersController < ApplicationController
  def index
    session["devise.provider_data"] = nil
  end
end