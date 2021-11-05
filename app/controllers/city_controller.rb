class CityController < ApplicationController

    def index
      @user_city = City.all
    end 

    def show
        @user_city = City.find(params[:id])
        @city_id = params[:id]
        @city_all_gossips = Gossip.joins(:user).where(users: { city_id: @city_id })
    end 
end
  