class LinksController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]
  def index
    @links = Link.all
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:notice] = "You have created a new link."
      redirect_to action: :index
    else
      flash[:alert] = "You done messed up bad."
      render :new
    end
  end

  def show

  end

  def destroy
    @link = Link.find(params[:id])
    @link.delete
    redirect_to action: :index
  end

private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
