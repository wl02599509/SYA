class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @link = Link.new
    @links = Link.where(user: current_user)
  end

  def create
    @link = Link.new(link_params)
    @link.save
    redirect_to links_path
  end

  def destination
    @link = Link.find_by_slug(params[:slug]) 

    if @link.nil?
      render 'errors/404', status: 404
      return
    end

    Link.update_counter(@link.id, :clicked => 1)
    redirect_to @link.url
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
