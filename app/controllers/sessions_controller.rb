class SessionsController < ApplicationController
   
# front end get page
   def new
       
   end
   
#   start session via POST
   def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
        flash[:success] = "Successful Login."
        redirect_to user_path(user)
       else
        flash.now[:danger] = "There was something wrong with your login. Please try again."
        render 'new'
       end
       
   end
   
#   stop sesion
   def destroy
       session[:user_id] = nil
       flash[:success] = "Logged out."
       redirect_to root_path
   end
   
   
    
end