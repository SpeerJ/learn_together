class RegistrationController < ApplicationController
  allow_unauthenticated_access
  def new
    @user = User.new
  end

  def create
    @user= User.create(registration_params)
    if @user.save
      start_new_session_for @user
      redirect_to root_path, notice: "Successfully registered a user!"
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end