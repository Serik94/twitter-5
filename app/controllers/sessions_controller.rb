class SessionsController < ApplicationController
  
  def new

  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(password: params[:session][:password])
      # Сохраняем сессию
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
    
  end
  
  def destroy
  end
  
end
