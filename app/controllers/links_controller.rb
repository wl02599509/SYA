class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.shorten(params[:link][:url], params[:link][:slug])
    redirect_to links_path
  end

  def show
    @link = Link.find_by_slug(params[:slug]) 
    if @link.nil?
      render 'errors/404', status: 404 
    else
      @link.update_attribute(:clicked, @link.clicked + 1)
      redirect_to @link.url
    end
  end

  private
  def link_params
    params.require(:link).permit(:url, :slug)
  end
end
