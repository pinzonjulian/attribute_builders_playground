class UsersController < ApplicationController
  def create
    session[:to_print] = params
    redirect_to "/material/params"
  end
end
