class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @link = Link.new
    @links = Link.where(user: current_user)
  end

  def show
    find_link
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path, notice: 'Successfully Shorten.'
    else
      @links = Link.where(user: current_user)
      render :index
    end
  end

  def destination
    @link = Link.find_by_slug(params[:slug]) 

    if @link.nil?
      render 'errors/404', status: 404
      return
    end

    Link.update_counters(@link.id, :clicked => 1)
    redirect_to @link.url
  end

  def destroy
    find_link
    @link.destroy
    redirect_to links_path, notice: 'Successfully Deleted.'
  end

  private
  def link_params
    params.require(:link).permit(:url, :slug)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end
