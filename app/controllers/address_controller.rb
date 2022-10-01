class AddressController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def show
  end
  
  def new
    @address = Address.new
  end
  
  def create
    if @address.save(address_params)
      redirect_to address_index_path, notice:'You shortened your URL successfully.'
    else
      render :new
    end
  end
  
  # def edit
  # end
  
  # def update
  #   if .update(params)
  #     redirect_to , notice: ''
  #   else
  #     render :edit
  #   end
  # end
  
  # def destroy
  #   redirect_to , notice: ''
  # end
  
  private
  def address_params
    params.require(:address).permit()
  end
  
  def find
  end
end
