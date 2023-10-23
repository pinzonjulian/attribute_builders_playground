class UsersController < ApplicationController
  def create
    session[:to_print] = params[:user]
    redirect_to "/material/params"
  end
end
