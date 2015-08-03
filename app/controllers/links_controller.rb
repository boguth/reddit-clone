class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
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

private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
