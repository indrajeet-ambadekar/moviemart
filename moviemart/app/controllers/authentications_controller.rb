class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(:provider => auth['provider'], :uid => auth['uid'])
    if authentication
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
      redirect_to authentications_path
    else
      user = User.new
      user.apply_omniauth(auth)
      user.username = auth['info']['nickname']
      user.email = auth['info']['email']
      if user.save
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = auth.except('extra')
        redirect_to new_user_registration_path
      end 
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
