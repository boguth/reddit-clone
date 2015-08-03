class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    if @new_link = Link.create(link_params)
      redirect_to action: index
    else
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
