class SessionsController < ApplicationController

#  def create
#    @user = User.find_or_create_from_auth_hash(auth_hash)
#    self.current_user = @user
#    redirect_to '/'
#  end

#  protected

#  def auth_hash
#    request.env['omniauth.auth']
#  end
#end




  def new
    @user = User.new
  end

  def create
    email = params[:email]
    password = params[:password]

    @user = User.find_by email: email
    if (@user) && (@user.authenticate password)
      session[:user_id] = @user.id
    else
      flash.now[:danger] = "Invalid entry."
      render :new
    end
  end

  def destroy
      session.delete :user_id
      redirect_to index_path
  end
end
