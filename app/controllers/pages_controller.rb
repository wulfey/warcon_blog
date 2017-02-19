class PagesController < ApplicationController
    
  def home
    
  end
  
  def index
    redirect_to articles_path if logged_in?
  end
  
  def about
  end
    
end
