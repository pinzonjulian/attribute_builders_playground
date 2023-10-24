class UsersController < ApplicationController
  def create
    session[:to_print] = params
    @user = User.new(user_params)
    if @user.valid?
      redirect_to "/material/params"
    else
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :email, :password, :onboarded, :active)
  end
end
