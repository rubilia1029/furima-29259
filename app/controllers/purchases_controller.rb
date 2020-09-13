class PurchasesController < ApplicationController
  before_action :move_to_new
  before_action :move_to_top
  
  def index
    @item = Item.find(params[:item_id])
  end 
  
  private
  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == item.user_id
      redirect_to root_path
    end
  end  
end
