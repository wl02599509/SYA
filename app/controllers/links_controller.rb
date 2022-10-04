class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = Link.all
  end

  def create
    if Link.same_slug?(params[:link][:slug])
      render :index
    else
      @link = Link.shorten(params[:link][:url], params[:link][:slug])
      redirect_to links_path
    end
  end

  def destination
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
