class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @link = Link.new
    @links = Link.where('user_id = ?', current_user.id)
  end

  def create
    if params[:link][:slug] == ""
      Link.shorten(params[:link][:url], Link.random_charts, current_user.id)
    else
      Link.shorten(params[:link][:url], params[:link][:slug], current_user.id)
    end
    redirect_to links_path
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

  def destroy
    find_link
    @link.destroy
    redirect_to links_path
  end

  private
  def link_params
    params.require(:link).permit(:url, :slug)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end
