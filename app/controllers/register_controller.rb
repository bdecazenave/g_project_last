class RegisterController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @city = City.all.sample.id
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email], 
      password: params[:password],
      city_id: @city
      )
        if @user.save
          redirect_to "/"
        else 
          render "new"
        end 
  end



end
