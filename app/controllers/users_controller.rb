class UsersController < ApplicationController
  def create
    session[:to_print] = params
    @user = User.new(user_params)
    @style_type = case request.referrer
                  when /material/
                    "material"
                  when /shoelace/
                    "shoelace"
                  when /default/
                    "default"
                  else
                    raise "unsupported"
                  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :email, :password, :onboarded, :active, :volume)
  end
end
