class AdminsController < ApplicationController
  # This makes sure that a user is logged in.
  before_action :authenicate_user!
  # This ensures that the logged in user is authorized to see this page(aka a admin)
  before_action :authorize

  # get "admin"
  def index
    @users = Users.all
  end

  # put/patch "admin/:id"
  def update
  end

  private

  # If the logged in user is not an admin role, then render this text.
  def authorize
    if !current_user.has_role? :admin
      render text:"No Access For You!!!"
    end
  end

end
