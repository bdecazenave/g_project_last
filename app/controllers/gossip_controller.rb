class GossipController < ApplicationController
  include SessionHelper
  before_action :authenticate_user, only: [:new, :show]
  
  def index
  @gossip = Gossip.all
  end 

  def show
    @gossip = Gossip.find(params[:id])
    @gossip_title = @gossip.title 
    @gossip_content = @gossip.content
    @gossip_author = @gossip.find_author_name
    @gossip_author_id = @gossip.user_id.to_i
  end

  def new
    @gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.new(
      title: params[:title], 
      content: params[:content],
      user: current_user
    )
    if @gossip.save
    redirect_to "/"
    else 
    render "new"
    end 
  end

  def destroy 
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/"
  end 

  def edit
    if current_user.first_name == @gossip_author
    @gossip = Gossip.find(params[:id])
    else 
      redirect_to "/"
    end
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
    redirect_to gossip_path
    else
    render :edit
    end
  end 
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end 


