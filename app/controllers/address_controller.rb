class AddressController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def show
  end
  
  def new
  end
  
  # def create
  #   if .save
  #     redirect_to , notice:''
  #   else
  #     render :new
  #   end
  # end
  
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
  
  # private
  # def params
  #   params.require().permit()
  # end
  
  # def find
  # end
end
