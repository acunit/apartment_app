class AdminsController < ApplicationController
  # This makes sure that a user is logged in.
  before_action :authenticate_user!
  # This ensures that the logged in user is authorized to see this page(aka a admin)
  before_action :authorize

  # get "admin"
  def index
    @users = User.all
  end

  # put/patch "admin/:id"
  def update
    user = User.find(params[:id])
    role = user.roles.last.name
    if user.roles.last.name == "user"
      user.remove_role :user
      user.add_role :admin
    elsif role == "admin"
      user.remove_role :admin
      user.add_role :user
    end
    redirect_to '/admins'
  end

  private

  # If the logged in user is not an admin role, then render this text.
  def authorize
    if !current_user.has_role? :admin
      render text:"No Access For You!!!"
    end
  end

end
