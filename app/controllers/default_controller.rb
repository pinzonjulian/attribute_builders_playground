class DefaultController < ApplicationController
  before_action do
    @user = User.new
  end

  def show
  end
end
