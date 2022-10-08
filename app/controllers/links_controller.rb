class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_link, only: %i[edit update destroy]

  def index
    @link = Link.new
    @links = Link.where(user: current_user)
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

    @link.increment!(:clicked, 1)
    redirect_to @link.url
  end

  def edit; end

  def update
    if @link.update(link_params)
      redirect_to links_path, notice: 'Successfully Update.'
    else
      render :edit
    end
  end

  def destroy
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
