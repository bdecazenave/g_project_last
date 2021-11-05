class WelcomeController < ApplicationController
  def show
    @user_name = params[:id]  
    puts params[:id] 
  end
end
